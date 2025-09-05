<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_cognitive_deployment.cognitive-deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cognitive_deployment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cognitive_deployments"></a> [cognitive\_deployments](#input\_cognitive\_deployments) | Map of cognitive deployment configurations. The key will be used as part of the deployment name. | <pre>map(object({<br>        cognitive_account_id = string<br>        model = object({<br>            format  = string<br>            name    = string<br>            version = optional(string)<br>        })<br>        sku = object({<br>            name     = string<br>            tier     = optional(string)<br>            size     = optional(string)<br>            family   = optional(string)<br>            capacity = optional(number) #TPM K<br>        })<br>        dynamic_throttling_enabled = optional(bool)<br>        rai_policy_name = optional(string)<br>        version_upgrade_option = optional(string)<br>    }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources that support them (Note: azurerm\_cognitive\_deployment does not support tags) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment_ids"></a> [deployment\_ids](#output\_deployment\_ids) | Map of deployment keys to their IDs |
<!-- END_TF_DOCS -->