# AWS

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

## S3
* Return the most recent file in a given S3 location
```bash
# Use "--query" in the next iteration
aws s3api list-objects-v2 \
  --bucket "BUCKET_NAME" \
  --prefix "BUCKET_URI" \
  --query 'sort_by(Contents, &LastModified)[-1].Key' \
  --output=text
```
