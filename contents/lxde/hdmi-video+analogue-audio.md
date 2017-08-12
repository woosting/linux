# HDMI video & Analogue audio
To prevent LXDE to switch the _audio_ device to HDMI too once an HDMI _video_ device is plugged in (e.g. when wanting to send digital video to a TV and analogue audio to a separate audio receiver):

- Pavucontrol

	1. Install pavucontrol:

	 	```
		# apt install pavucontro
		```

	2. Open the program:

		```
	 	$ gnome-control-center sound &
		```

- Gnome-control-center

	1. Installation:

	 	```
		# apt install gnome-control-center
		```

	2. Open the program:

	 	```
		$ pavucontrol &
		```
