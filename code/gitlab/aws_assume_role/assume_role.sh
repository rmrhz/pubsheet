#!/bin/bash
set -e
role_arn=$CI_AWS_ROLE_ARN
session_name="${CI_BUILD_ID}-`date +%Y%m%d`"

echo 'Assuming role...'
sts=( $(
    aws sts assume-role \
    --role-arn "$role_arn" \
    --role-session-name "$session_name" \
    --query 'Credentials.[AccessKeyId,SecretAccessKey,SessionToken]' \
    --output text
) )
export AWS_ACCESS_KEY_ID=${sts[0]}
export AWS_SECRET_ACCESS_KEY=${sts[1]}
export AWS_SESSION_TOKEN=${sts[2]}