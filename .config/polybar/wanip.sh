#!/usr/bin/env bash
WANIP=`dig +short myip.opendns.com @resolver1.opendns.com`

# catching 'dig: couldn't resolve resolver1.open.dns.com' with no internet
if [[ $WANIP == *"dig"* ]]
then
	echo "no internet"
# if tun0 is up, openvpn is running, which should mean we're over VPN
elif [[ `ip link` == *"tun0"* ]]
then
	echo "$WANIP (vpn)"
# if wifi is up, then we should be connected to wifi
elif [[ `ip link` == *"wlp2s0"* ]]
then
	echo "$WANIP (wifi)"
# if eth0 is up, we have an ethernet cable and are likely over ethernet
elif [[ `ip link` == *"eth0"* ]]
then
	echo "$WANIP (eth)"
# otherwise, nothing is up besides loopback, so no internet
else
	echo "no internet"
fi
