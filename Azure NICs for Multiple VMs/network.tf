# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "${var.resource_prefix}-${var.environment}-rg"
  location = var.location
  tags     = var.default_tags
}

# Virtual Network
resource "azurerm_virtual_network" "main" {
  name                = "${var.resource_prefix}-${var.environment}-vnet"
  address_space       = ["10.1.2.0/25"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags
}

# Subnets
resource "azurerm_subnet" "my_zone" {
  name                 = var.subnet_config.my_zone.name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.subnet_config.my_zone.address_prefix]
}

# Network Security Groups
resource "azurerm_network_security_group" "my_zone" {
  name                = "${var.resource_prefix}-${var.environment}-my_zone-nsg"
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  tags                = var.default_tags

  # Allow internal VNet communication
  security_rule {
    name                       = "AllowVNetInbound"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.1.2.0/25"
    destination_address_prefix = "*"
  }

  # Allow outbound to VNet
  security_rule {
    name                       = "AllowVNetOutbound"
    priority                   = 1000
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "10.1.2.0/25"
  }

  # Allow outbound to Azure services (for Windows updates, etc.)
  security_rule {
    name                       = "AllowAzureServicesOutbound"
    priority                   = 1010
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate NSGs with subnets
resource "azurerm_subnet_network_security_group_association" "my_zone" {
  subnet_id                 = azurerm_subnet.my_zone.id
  network_security_group_id = azurerm_network_security_group.my_zone.id
}