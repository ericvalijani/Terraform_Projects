# Network Interface Cards
resource "azurerm_network_interface" "vm" {
  count               = var.vm_count
  name                = "${var.resource_prefix}-${var.environment}-vm-${count.index + 1}-nic"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = var.default_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_zone.id
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.subnet_config["my_zone"].address_prefix, count.index + 5)
  }
}

# Virtual Machines
resource "azurerm_windows_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.resource_prefix}-${var.environment}-vm-${count.index + 1}"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  tags                = var.default_tags
  computer_name       = "${var.resource_prefix}-${var.environment}-vm-${count.index + 1}"

  network_interface_ids = [
    azurerm_network_interface.vm[count.index].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    name                 = "${var.resource_prefix}-${var.environment}-vm-${count.index + 1}-osdisk"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}