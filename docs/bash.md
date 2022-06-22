# Bash

## Command Dump
```bash
# Find specific string in Nginx access logs
zcat -f access.log* | grep example.com

# Converts decimal to hexadecimal
INT=69
echo "obase=16; ${INT}" | bc

# Find a string from the offset
OFFSET=69
awk -b "{ nb += length + 1 } nb >= ${OFFSET} { print; exit }" file

# Find the 5 directories with the most disk usage
find ./ -type f -exec du -Sh {} + | sort -rh | head -n 5

# Returns the md5 sum of a cert/key
openssl rsa -noout -modulus -in file  2> /dev/null | openssl md5

# Returns the serial of a cert
openssl x509 -noout -serial -in file | cut -d'=' -f2 | sed 's/../&:/g;s/:$//'

# Return base64 hash of a cert
openssl s_client -servername example.com -connect example.com:443 | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64
```
