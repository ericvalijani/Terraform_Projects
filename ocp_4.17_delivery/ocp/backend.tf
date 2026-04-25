terraform {
 backend "http" {
   address                = "https://git.salehmiri.ir/api/v4/projects/19/terraform/state/ocp_delivery_tfstate"
   lock_address           = "https://git.salehmiri.ir/api/v4/projects/19/terraform/state/ocp_delivery_tfstate/lock"
   unlock_address         = "https://git.salehmiri.ir/api/v4/projects/19/terraform/state/ocp_delivery_tfstate/lock"
   lock_method            = "POST"
   unlock_method          = "DELETE"
   skip_cert_verification = true
 }
}
