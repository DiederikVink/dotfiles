#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Startup programs
dropbox &
sxhkd -m 1 &
compton &
redshift &
dunst &
wal -R
feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
xinput set-prop 'DLL075B:01 06CB:76AF Touchpad' 'libinput Natural Scrolling Enabled' 1
xsetroot -cursor_name left_ptr

#exec i3
exec bspwm
