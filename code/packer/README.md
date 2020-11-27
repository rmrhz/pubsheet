# Packer

## Role Assumption
An error will be ouputted even if a Gitlab CI runner is attached to an IAM profile. This is because Ansbile will check the local filesystem's credentials instead of being a fallback validation.

```hcl
assume_role {
  role_arn     = "arn:aws:iam::${var.account_id}:role/packer"
  session_name = "PackerBuilder-${local.timestamp}"
  external_id  = "PackerBuilder"
}
```
