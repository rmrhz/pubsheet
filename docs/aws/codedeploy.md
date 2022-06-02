# AWS Codedeploy

## Troubleshooting
```bash
# Fixes to a failed in-place deployment.
# --
# This happens when there's an existing deployment but the current deployment cannot execute the ApplicationStop step
rm /opt/codedeploy-agent/deployment-root/deployment-instructions/*
```

## Bash Dump
```bash
# Makes sure the current working directory is the current deployment
CUR_DIR="$(pwd ./)"

if [[ ! -z "$DEPLOYMENT_GROUP_ID" && $CUR_DIR != *"$DEPLOYMENT_GROUP_ID"* ]] && [[ ! -z "$DEPLOYMENT_ID" && $CUR_DIR != *"$DEPLOYMENT_ID"* ]];
then
  CUR_DIR="$CUR_DIR/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive"
fi;

# If a key doesn't exist in S3 return an error
if [[ ! $(aws s3 ls s3://bucket/key | head) ]];
then
  echo "folder does not exist" >&2
  exit 1
fi
```
