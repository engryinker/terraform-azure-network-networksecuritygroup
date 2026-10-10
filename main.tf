data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "network_security_group" {
  source   = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version  = "0.6.0"
  for_each = var.network_security_groups

  name                = each.value.name
  location            = var.location
  parent_id           = data.azurerm_resource_group.this.id
  tags                = coalesce(each.value.tags, var.tags)
  enable_telemetry    = coalesce(each.value.enable_telemetry, var.enable_telemetry)
  lock                = each.value.lock
  retry               = each.value.retry
  ignore_body_changes = each.value.ignore_body_changes
  resource_types      = each.value.resource_types
  role_assignments    = each.value.role_assignments
  timeouts            = each.value.timeouts
  security_rules      = each.value.security_rules
  diagnostic_settings = each.value.diagnostic_settings
}
