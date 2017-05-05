#########################
# Open i3 in debug mode #
#########################
exec i3 -V >> ~/.i3/i3log >&1

# auto-start xbindkeys on startx
xbindkeys

#############################
# Set the screen resolution #
#############################
xrandr --output eDP-1 --mode 2880x1800
