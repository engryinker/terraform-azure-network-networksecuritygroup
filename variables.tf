variable "resource_group_name" {
  description = "Name of the existing resource group to deploy every resource in this module call into. This module does not create the resource group itself."
  type        = string
}

variable "location" {
  description = "Azure region for every resource created by this module call."
  type        = string
}

variable "tags" {
  description = "Default tags applied to every resource created by this module call (e.g. the output of terraform-azure-tags). Overridden per-resource by that resource's own `tags` attribute, if set."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "Default AVM telemetry opt-in/out applied to every resource created by this module call. See https://aka.ms/avm/telemetry. Overridden per-resource by that resource's own `enable_telemetry` attribute, if set."
  type        = bool
  default     = true
}

variable "network_security_groups" {
  description = "Map of network security groups to create, keyed by an arbitrary caller-chosen map key. Mirrors the inputs of Azure/avm-res-network-networksecuritygroup/azurerm v0.6.0 (https://registry.terraform.io/modules/Azure/avm-res-network-networksecuritygroup/azurerm/0.6.0) 1:1 -- see upstream docs for the schema of any field typed `any`. `name`, `tags` and `enable_telemetry` (where present upstream) are handled specially by this wrapper; every other field is passed straight through unmodified."
  type = map(object({
    name                = string
    tags                = optional(map(string))
    enable_telemetry    = optional(bool)
    lock                = optional(any, null)
    retry               = optional(any, null)
    ignore_body_changes = optional(any, null)
    resource_types      = optional(any, null)
    role_assignments    = optional(any, null)
    timeouts            = optional(any, null)
    security_rules      = optional(any, {})
    diagnostic_settings = optional(any, null)
  }))
  default = {}
}
