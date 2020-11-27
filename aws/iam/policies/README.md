# IAM Policy Cheatsheet

### Retrieving Encrypted Parameter
```bash
# Policy : ssm.parameter.read.json
aws ssm get-parameters --names "$PARAMETER_KEY" --with-decryption --query "Parameters[*].{Value:Value}" --output text
```