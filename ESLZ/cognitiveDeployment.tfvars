###############################################
# cognitiveDeployment.tfvars
# Values + commented examples for optional fields
# Adjust placeholders (subscription IDs, resource names, locations) as needed.
###############################################

# Required naming/context variables
env               = "G3Dc"          # Must match pattern Upper-lower-Upper-lower per validation
group             = "ABC"          # Alphanumeric only
project           = "Portal"        # Alphanumeric only
userDefinedString = "GPT4o"         # Alphanumeric only - model identifier

# Resource group object (expected: name & location)
resource_group = {
    name     = "rg-apps-portal-devp"
    location = "canadacentral"
}

# Cognitive deployment configurations - Map of deployments
cognitive_deployments = {
    # GPT-4o deployment
    "gpt4o" = {
        # REQUIRED: Cognitive Account ID where deployment will be created
        cognitive_account_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-ai/providers/Microsoft.CognitiveServices/accounts/openai-account-dev"
        
        # REQUIRED: Model configuration
        model = {
            format  = "OpenAI"           # Format of the model (e.g., OpenAI)
            name    = "gpt-4o"          # Model name
            version = "2024-05-13"      # Model version
        }
        
        # REQUIRED: SKU configuration for scaling
        sku = {
            name     = "Standard"       # SKU name (e.g., Standard, GlobalStandard)
            capacity = 10               # Token capacity (TPM in thousands)
        }
        
        # OPTIONAL attributes
        # rai_policy_name        = "Microsoft.Default"
        # version_upgrade_option = "OnceNewDefaultVersionAvailable"
        # dynamic_throttling_enabled = true
    }
    
    # GPT-3.5-Turbo deployment
    "gpt35turbo" = {
        cognitive_account_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-ai/providers/Microsoft.CognitiveServices/accounts/openai-account-dev"
        
        model = {
            format  = "OpenAI"
            name    = "gpt-35-turbo"
            version = "0613"
        }
        
        sku = {
            name     = "Standard"
            capacity = 30               # Higher capacity for turbo model
        }
    }
    
    # Text Embedding deployment
    "embedding" = {
        cognitive_account_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-ai/providers/Microsoft.CognitiveServices/accounts/openai-account-dev"
        
        model = {
            format  = "OpenAI"
            name    = "text-embedding-ada-002"
            version = "2"
        }
        
        sku = {
            name     = "Standard"
            capacity = 120              # Higher capacity for embedding workloads
        }
    }
}

# Optional tags (Note: azurerm_cognitive_deployment resource doesn't support tags directly)
tags = {
    Environment = "dev"
    Project     = "Portal"
    Owner       = "team@example.org"
    Purpose     = "OpenAI Model Deployments"
}

###############################################
# Common model configurations:
# 
# GPT-4:
#   name = "gpt-4"
#   version = "0613" or latest
#
# GPT-3.5-Turbo:
#   name = "gpt-35-turbo"
#   version = "0613" or latest
#
# Text Embedding Ada 002:
#   name = "text-embedding-ada-002"
#   version = "2"
#
# DALL-E 3:
#   name = "dall-e-3"
#   version = "3.0"
###############################################