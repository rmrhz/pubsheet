# AWS

### S3
* Return the most recent file in a given S3 location
```bash
# Use "--query" in the next iteration
aws s3api list-objects-v2 \
  --bucket "BUCKET_NAME" \
  --prefix "BUCKET_URI" \
  --query 'sort_by(Contents, &LastModified)[-1].Key' \
  --output=text
```
