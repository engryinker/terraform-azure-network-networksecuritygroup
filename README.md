# terraform-azure-network-networksecuritygroup

Org-standard Terraform wrapper for: **network security groups**.

Deploys into an existing resource group (passed in via `resource_group_name` / `location`) -- this module does not create the resource group itself. Compose with [terraform-azure-naming](https://github.com/engryinker/terraform-azure-naming) for names and [terraform-azure-tags](https://github.com/engryinker/terraform-azure-tags) for the `tags` input.

## Usage

```hcl
module "network-networksecuritygroup" {
  source = "git::https://github.com/engryinker/terraform-azure-network-networksecuritygroup.git?ref=v1.0.0"

  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  tags                = module.tags.tags

  network_security_groups = {
    example = {
      # see Inputs below -- every field upstream supports, see linked AVM module docs for the full schema
    }
  }
}
```

See [`examples/basic`](examples/basic) for a minimal runnable (zero-instance) example.

## Inputs

Beyond the standard `resource_group_name`, `location`, `tags`, `enable_telemetry` module-level variables, each map variable below mirrors its upstream AVM module's inputs 1:1 (fields typed `any` carry complex nested upstream schemas -- see the linked module docs):

### `network_security_groups` (network security groups)

Wraps [Azure/avm-res-network-networksecuritygroup/azurerm](https://registry.terraform.io/modules/Azure/avm-res-network-networksecuritygroup/azurerm/0.6.0) v0.6.0.

| Field | Type | Required | Notes |
| --- | --- | --- | --- |
| `name` | `string` | yes | Resource name. |
| `lock` | `any` | no |  |
| `retry` | `any` | no |  |
| `ignore_body_changes` | `any` | no |  |
| `resource_types` | `any` | no |  |
| `role_assignments` | `any` | no |  |
| `timeouts` | `any` | no |  |
| `security_rules` | `any` | no |  |
| `diagnostic_settings` | `any` | no |  |
| `tags` | `map(string)` | no | Overrides the module-level `tags` for this entry only. |
| `enable_telemetry` | `bool` | no | Overrides the module-level `enable_telemetry` for this entry only. |

## Outputs

- `network_security_groups` -- map (same keys as the input) of every output from each created network security groups.
