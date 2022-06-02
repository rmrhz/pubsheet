# AWS

## Resource Documentation
* [Cloudwatch](aws/cloudwatch.md)
* [Codedeploy](aws/codedeploy.md)
* [S3](aws/s3.md)

## IAM Policy Cheatsheet

### Packer
Permissions needed in order to run Packer and build an AMI with role assumption
```bash
# Policy : packer.json
packer build template.pkr.hcl
```

### Retrieving Encrypted Parameter
```bash
# Policy : ssm.parameter.read.json
aws ssm get-parameters --names "$PARAMETER_KEY" --with-decryption --query "Parameters[*].{Value:Value}" --output text
```
