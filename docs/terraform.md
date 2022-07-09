# Terraform

## Code Samples
* [Github Actions OIDC for AWS](/code/terraform/oidc)
* [EC2 NAT Gateway](/code/terraform/nat)

## Unorganized

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

```hcl
module "sample_gitlab" {
  source = "git::ssh://git@gitlab.com/username/project.git"
}

module "sample_github" {
  source "git@github.com:username/project.git"
}
```
