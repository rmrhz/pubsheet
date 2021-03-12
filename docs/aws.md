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
* Return the most recent object version of a given S3 object
```bash
aws s3api list-object-versions \
  --bucket "BUCKET_NAME" \
  --prefix "BUCKET_URI" \
  --query "Versions[0].VersionId" \
  --output text
```
* Return the most recent file in a given S3 location
```bash
# Use "--query" in the next iteration
aws s3api list-objects-v2 \
  --bucket "BUCKET_NAME" \
  --prefix "BUCKET_URI" \
  --query 'sort_by(Contents, &LastModified)[-1].Key' \
  --output text
```
* Return the latest version of an object
```bash
aws s3api list-object-versions \
  --bucket "BUCKET_NAME" \
  --prefix "BUCKET_URI" \
  --no-paginate \
  --query 'Versions[0].VersionId' --output=text
```

## Lambda
* Return the most recent function version
```bash
aws lambda list-versions-by-function \
  --function-name "FUNCTION_NAME" \
  --query "reverse(Versions[*].{Version:Version})[0].Version" \
  --output text
```
