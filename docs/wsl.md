# Windows Subsystem Linux

## Exports
```bash
# /home/{user}/.bash_profile

# mysql -u username -p -h $WSL_HOST_IP
export WSL_HOST_IP=$(awk '/nameserver/ { print $2 }' /etc/resolv.conf)
```

## Notes
* When an instance of MySQL is installed in the host machine, whitelist the entire /16 subnet WSL is currently using `172.27.0.0/255.255.0.0` when creating a user.
