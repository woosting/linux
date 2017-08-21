# Vino


## Operation


### Start

Start the Vino server:

```
$ /usr/lib/vino/vino-server &
```


### Stop

Stop the Vino server:

```
$ pkill vino-server
```


### Auto-start

Refer to `/usr/lib/vino/vino-server` in the auto-start definitions of the DE at hand.


## Installation

1. Install Vino from the repository:

	```
	# apt install vino
	```

2. Start the 'Gnome control center' from an emulated Terminal within the DE:

	```
	$ gnome-control-center
	```
3. Use the dialog to configure the DE for vino.


## Troubleshooting


### 'No supported authentication methods!' workaround

Configure Vino not to use encryption to prevent clients reporting: `No supported authentication methods!`:

```
# gsettings set org.gnome.Vino require-encryption false
```


<!-- NGREP ONELINERS

>>> Start Vino server:                                     $ /usr/lib/vino/vino-server &

>>> Counter Vino's `No supported authentication methods!`: # gsettings set org.gnome.Vino require-encryption false

-->
