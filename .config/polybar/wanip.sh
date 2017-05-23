#!/usr/bin/env bash
FAIL_STRING="dig: couldn't get address for 'resolver1.opendns.com': not found"
WANIP=$(dig +short myip.opendns.com @resolver1.opendns.com 2>&1 | sed -e "s/$FAIL_STRING/no internet/g")

# if tun0 is up, openvpn is running, which should mean we're over VPN
if [[ `ip link` == *"tun0"* ]]
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
	echo "$WANIP (no interfaces)"
fi
