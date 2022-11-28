# Terraform

## Code Samples
* [Github Actions OIDC for AWS](/code/terraform/oidc)
* [EC2 NAT Gateway](/code/terraform/nat)

## Related Scripts
```sh
# Show all deprecated resources from state
terraform validate -json | jq -r '[ del( .diagnostics[] | select( .detail | startswith( "Experimental features" ) ) ) | .diagnostics[] | { Detail:.detail, Address:.address, Filename:.range.filename, Line:.range.start.line } ] | ( .[0] | keys_unsorted | ( . , map( length*"-" ) ) ), .[] | map(.) | @tsv' | column -ts $'\t'
```

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
