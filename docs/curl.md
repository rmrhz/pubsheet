# cURL

* Adds a user for proxy access
```bash
# Preq.
# /home/username/.ssh (700)
# /home/username/authorized_keys (600)
adduser username --disabled-password --shell=/bin/true

# Maintains an SSH session without closing in the background 
ssh -N -D 6969 username@proxy.example.com
curl --socks5 localhost:6969 domain.tld
```

* Calculating latency
```bash
# src : https://stackoverflow.com/a/22625150 / https://superuser.com/a/1088818
# curl-format.txt
# time_namelookup         :  %{time_namelookup}\n
# time_appconnect         :  %{time_connect}\n
# time_appconnect         :  %{time_appconnect}\n
# time_pretransfer        :  %{time_pretransfer}\n
# time_redirect           :  %{time_redirect}\n
# time_starttransfer      :  %{time_starttransfer}\n
# ----------\n
# time_total              :  %{time_total}\n
curl -w "@curl-format.txt" -o /dev/null -s https://example.com
```
