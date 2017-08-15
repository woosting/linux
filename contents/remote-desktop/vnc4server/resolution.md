# Resolution variation

Have the vnc4server serve video of various resolutions:

1. Start the server with multiple 'geometry' instances:

	```
	$ vnc4server -geometry <1920x1200> -geometry <1280x1024>
	```

2. Use `xrandr` from a terminal via the vncviewer (with: 'allow dymanic desktop resizing' enabled):

	1. Show all available resolution modes:

		```
		$ xrandr
		```
		> NOTE: The options should correspond with the values used starting the server (in step 1).

	2. Change the resolution:

	 	```
		$ xrandr -s <1280x1024>
		```

		> ALTERNATIVE: a "mode" can be choosen by using the number presented after executing `xrandr` without any arguments.


## References

> StackOverflow:
[Article][1]


<!-- REFERENCES -->

[1]:http://stackoverflow.com/a/8388065/6737459
