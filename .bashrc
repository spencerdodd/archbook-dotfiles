#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

screenfetch

vpnc() {
	if [[ $1 == "start" ]]
	then
		sudo openvpn --config /etc/openvpn/client/US\ East.ovpn &
	elif [[ $1 == "down" ]]
	then
		sudo killall -s SIGKILL openvpn
	elif [[ $1 == "start" && $2 == "location" ]]
	then
		sudo openvpn --config /etc/openvpn/client/$3 &
	fi
}


wifi() {
	if [[ $1 == "down" ]]
	then
		if [[ `ip link` == *"tun0"* ]]
		then
			vpnc down
		fi
		sudo netctl stop-all
		sudo ip link set wlp2s0 down
	elif [[ $1 == "new" ]]
	then
		sudo netctl stop-all
		sudo ip link set wlp2s0 down
		sudo wifi-menu
	elif [[ $1 == "connect" ]]		
	then
		sudo netctl stop-all
		sudo ip link set wlp2s0 down
		sudo netctl start $2		# lol command injection
	fi
}

brightness() {
	CURRENT_BRIGHTNESS=$(sudo cat /sys/class/backlight/intel_backlight/brightness)
	STEP=200

	if [[ $1 == "max" ]]
	then
		echo "1953" | sudo tee /sys/class/backlight/intel_backlight/brightness
	elif [[ $1 == "up" ]]
	then
		NEXT_BRIGHTNESS=$(($CURRENT_BRIGHTNESS+$STEP))
		echo $NEXT_BRIGHTNESS | sudo tee /sys/class/backlight/intel_backlight/brightness
	elif [[ $1 == "down" ]]
	then
		NEXT_BRIGHTNESS=$(($CURRENT_BRIGHTNESS-$STEP))
		echo $NEXT_BRIGHTNESS | sudo tee /sys/class/backlight/intel_backlight/brightness
	fi
}


