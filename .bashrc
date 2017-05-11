#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

screenfetch
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias vpn='sudo openvpn --config /etc/openvpn/client/US\ East.ovpn &'
alias vpn-down='sudo killall -s SIGKILL openvpn'
alias brightness-max='echo "1953" | sudo tee /sys/class/backlight/intel_backlight/brightness'
alias brightness-mid='echo "1000" | sudo tee /sys/class/backlight/intel_backlight/brightness'
alias brightness-min='echo "500" | sudo tee /sys/class/backlight/intel_backlight/brightness'
