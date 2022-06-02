# Assume AWS Role in Gitlab CI/CD

```yaml
deploy:
  stage: deploy
  dependencies:
      - build
  before_script:
    - chmod +x scripts/assume_role.sh
    - source scripts/assume_role.sh arn:aws:iam::account_id:role/name
  script:
    - aws s3 cp file s3://bucket/file
  only:
    - master
```