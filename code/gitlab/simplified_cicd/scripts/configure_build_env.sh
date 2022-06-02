#!/usr/bin/env bash

# Make sure we don't have an existing deploy.env file
rm build/deploy.env

DEPLOY_ENV_NAME=$(scripts/get_deploy_stage.sh)
DEPLOY_ENV_URL=$(scripts/get_deploy_url.sh)

echo "DEPLOY_ENV_NAME=$DEPLOY_ENV_NAME" >> build/deploy.env
echo "DEPLOY_ENV_URL=$DEPLOY_ENV_URL" >> build/deploy.env