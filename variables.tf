variable "cognitive_deployments" {
    description = "Map of cognitive deployment configurations. The key will be used as part of the deployment name."
    type = map(object({
        cognitive_account_id = string
        model = object({
            format  = string
            name    = string
            version = optional(string)
        })
        sku = object({
            name     = string
            tier     = optional(string)
            size     = optional(string)
            family   = optional(string)
            capacity = optional(number) #TPM K
        })
        dynamic_throttling_enabled = optional(bool)
        rai_policy_name = optional(string)
        version_upgrade_option = optional(string)
    }))
}

variable "tags" {
  description = "Tags to be applied to resources that support them (Note: azurerm_cognitive_deployment does not support tags)"
  type = map(string)
  default = {}
}