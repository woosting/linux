# xstartup

-----

**THIS PAGE NEEDS REVISING**
It is merely a reference dump currently!

-----

My crurrent `~/.vnc/xstartup/`:

```sh
 #!/bin/sh

	#xrdb $HOME/.Xresources
	xsetroot -solid grey -cursor_name left_ptr
	#x-terminal-emulator -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" &
	#x-window-manager &

	# Fix to make GNOME work
	#export XKL_XMODMAP_DISABLE=1
	#/etc/X11/Xsession

	# -- EDIT FOR LXDE
	/usr/bin/lxsession -s LXDE &
	#exec startlxde -geometry 1920x1080 -geometry 1024x768
```
