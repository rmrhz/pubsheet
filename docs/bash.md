# Bash

## Command Dump
```bash
# Find specific string in Nginx access logs
zcat -f access.log* | grep example.com

# Find the 5 directories with the most disk usage
find ./ -type f -exec du -Sh {} + | sort -rh | head -n 5

# Return base64 hash of a cert
openssl s_client -servername example.com -connect example.com:443 | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64
```
