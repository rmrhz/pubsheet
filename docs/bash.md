# Bash

# Command Dump
* Requests for a Lets Encrypt wildcard TLS certificate
```bash
certbot certonly \
 --manual \
 --preferred-challenges=dns \
 --email email@example.com \
 --server https://acme-v02.api.letsencrypt.org/directory \
 --agree-tos \
 -d domain.tld
```
