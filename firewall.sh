#!/bin/sh
### BEGIN INIT INFO
# Provides:          Firewall Linux
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:
# Default-Stop:
# X-Interactive:     false
# Short-Description: Firewall Linux
### END INIT INFO

# Mise à 0
iptables -t filter -F
iptables -t filter -X
echo "Mise à 0"

# On bloque tout
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP
echo "Interdiction"

# Ne pas casser les connexions établies
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Autorise le loopback (127.0.0.1)
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT
echo "Configuration Loopback OK"

# ICMP (le ping)
iptables -t filter -A INPUT -p icmp -j DROP
iptables -t filter -A OUTPUT -p icmp -j DROP
echo "Configuration Ping ok"

# SSH IN/OUT
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 22 -j ACCEPT
echo "Configuration SSH ok"

# DNS In/Out
iptables -t filter -A OUTPUT -p tcp --dport 53 -j DROP
iptables -t filter -A OUTPUT -p udp --dport 53 -j DROP
iptables -t filter -A INPUT -p tcp --dport 53 -j DROP
iptables -t filter -A INPUT -p udp --dport 53 -j DROP
echo "Configuration dns ok"

# NTP Out
iptables -t filter -A OUTPUT -p udp --dport 123 -j DROP
echo "Configuration ntp ok"

# HTTP + HTTPS Out
iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT
echo "Configuration https ok"

# HTTP + HTTPS In
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
echo "Configuration http ok"

# FTP Out
iptables -t filter -A OUTPUT -p tcp --dport 21 -j DROP
iptables -t filter -A OUTPUT -p tcp --dport 20 -j DROP

# FTP In
iptables -t filter -A INPUT -p tcp --dport 20 -j DROP
iptables -t filter -A INPUT -p tcp --dport 21 -j DROP
iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j DROP
echo "Configuration ftp ok"

# Mail SMTP:25
iptables -t filter -A INPUT -p tcp --dport 25 -j DROP
iptables -t filter -A OUTPUT -p tcp --dport 25 -j DROP

# Mail POP3:110
iptables -t filter -A INPUT -p tcp --dport 110 -j DROP
iptables -t filter -A OUTPUT -p tcp --dport 110 -j DROP

# Mail IMAP:143
iptables -t filter -A INPUT -p tcp --dport 143 -j DROP
iptables -t filter -A OUTPUT -p tcp --dport 143 -j DROP

# Mail POP3S:995
iptables -t filter -A INPUT -p tcp --dport 995 -j DROP
iptables -t filter -A OUTPUT -p tcp --dport 995 -j DROP
echo "Configuration mail ok"

# OPENVPN:1194
iptables -t filter -A INPUT -p tcp --dport 1194 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 1194 -j ACCEPT
echo "Configuration openvpn ok"
