terraform {
  required_version = ">= 1.7.0"
}

module "network-networksecuritygroup" {
  source = "../.."

  resource_group_name = "rg-example"
  location            = "eastus"
  tags = {
    environment = "dev"
  }

  network_security_groups = {} # see README Inputs table / upstream module docs for the per-entry schema
}
