#!/usr/bin/env bash
WANIP=`dig +short myip.opendns.com @resolver1.opendns.com`

if [[ `ip link` == *"tun0"* ]]
then
	echo "$WANIP (VPN)"
elif [[ `ip link` == *"wlp2s0"* ]]
then
	echo "$WANIP (WIFI)"
elif [[ `ip link` == *"eth0"* ]]
then
	echo "$WANIP (ETHERNET)"
else
	echo "NO INTERNET"
fi
