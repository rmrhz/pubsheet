# Ansible

```yaml
# Underlying process still updating
# src : https://github.com/ansible/ansible/issues/25414#issuecomment-477260545

- name: Wait for any possibly running unattended upgrade to finish
  raw: systemd-run --property="After=apt-daily.service apt-daily-upgrade.service" --wait /bin/true
```
