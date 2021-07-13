# Certbot

## Wildcard DNS
```bash
certbot certonly \
 --manual \
 --preferred-challenges=dns \
 --email rmrhz@nonein.site \
 --server https://acme-v02.api.letsencrypt.org/directory \
 --domain *.domain.tld
```