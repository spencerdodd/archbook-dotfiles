#########################
# Open i3 in debug mode #
#########################
exec i3 -V >> ~/.i3/i3log >&1

# auto-start xbindkeys on startx
if [ `type -P xbindkeys` ]; then
	# Load custom keyboard key bindings
	xbindkeys
fi;

#############################
# Set the screen resolution #
#############################
xrandr --output eDP-1 --mode 2880x1800

#########################
# Set the background(?) #
#########################
eval feh --bg-scale ~/photos/dystopia.jpg
