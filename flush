#!/bin/sh
### BEGIN INIT INFO
# Provides:          Remise à zéro
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:
# Default-Stop:
# X-Interactive:     false
# Short-Description: Remise à zéro des régles du firewall
### END INIT INFO


sleep 1
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
