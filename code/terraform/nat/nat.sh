#!/bin/sh
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/conf/ens5/send_redirects
mkdir -p /etc/iptables/
/sbin/iptables -t nat -A POSTROUTING -o ens5 -s 0.0.0.0/0 -j MASQUERADE
/sbin/iptables-save > /etc/iptables/rules.v4
echo "/sbin/iptables-restore < /etc/iptables/rules.v4" >> /etc/rc.local
mkdir -p /etc/sysctl.d/
cat <<EOF > /etc/sysctl.d/nat.conf
net.ipv4.ip_forward = 1
net.ipv4.conf.ens5.send_redirects = 0
EOF