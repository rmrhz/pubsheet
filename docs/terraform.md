# Terraform

```bash
# Migration from <12 to >13
terraform state replace-provider "registry.terraform.io/-/aws" "hashicorp/aws"
```

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider {
  profile = "_name_profile_"
}
```
