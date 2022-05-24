#!/bin/bash
# Ubuntu 22 comes with the quirk that its Version of SNMP doesn't want to accept udp:161 as a valid agent address. The idea behind this script is to easily get all address interfaces and append them into the custom config under /etc/snmp/snmpd.conf.d/
sed -i '/agentaddress/d' /etc/snmp/snmpd.conf.d/custom.conf
ipaddr=$(ip addr | grep -o -P '(?<=inet ).*(?=/)' | sed "s|$|,|" | tr -d '\n' | sed "s|$|[::1]|")
echo agentaddress\ $ipaddr >> /etc/snmp/snmpd.conf.d/custom.conf
