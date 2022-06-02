# Ubuntu

## Configuration
```bash
# Legacy notes to fix locale related problems
LANGUAGE="en_US.UTF-8"
LANG=en_US.UTF-8
LC_ALL="en_US.UTF-8"

# x82 relevant apt source
# --
# AWS Japan
sudo sed -i -e "s/archive.ubuntu.com/ap-northeast-1.ec2.archive.ubuntu.com/g" /etc/apt/sources.list
# AWS Singapore
sudo sed -i -e "s/archive.ubuntu.com/ap-southeast-1.ec2.archive.ubuntu.com/g" /etc/apt/ssources.list

# Disable unattended upgrades that consumes disk space over time.
#   Command permanently removes the feature
#		location ~ /usr/src
# --
# /etc/apt/apt.conf.d/20auto-upgrades
# APT::Periodic::Update-Package-Lists "0"; # Default "1"
# APT::Periodic::Unattended-Upgrade "0"; # Default "1"
sudo apt -y purge --auto-remove unattended-upgrades

```
