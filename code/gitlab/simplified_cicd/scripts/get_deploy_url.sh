#!/usr/bin/env bash
source scripts/import_env.sh

ENV_NAME=$([ "$CI_MERGE_REQUEST_TARGET_BRANCH_NAME" != "" ] && echo "$CI_MERGE_REQUEST_TARGET_BRANCH_NAME" || echo "")

case $ENV_NAME in

  master)
  echo -n $PRODUCTION_URL
  ;;

  develop)
  echo -n $DEVELOPMENT_URL
  ;;

  *)
  echo -n $DEVELOPMENT_URL
  ;;

esac