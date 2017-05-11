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
