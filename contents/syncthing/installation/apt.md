# Syncthing installation via apt

> _Note: As of Debian 9 (Stretch) Syncthing can be installed from the official repository making this how-to obsolete (THIS NEEDS TESTING!):_
>	```
>	apt install syncthing
>	```

1. Add the release PGP keys:
	```
	# curl -s https://syncthing.net/release-key.txt | apt-key add -
	```
	>	Note the `-` at the end.

2. Add the "stable" channel to your APT sources:

	```
	# echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list
	```

3. Update Apt and install syncthing:

	```
	# apt update && apt install syncthing
	```

    >	In case you get any (or all) of the following messages (dependent on your distribution):
    >
    >	```
    >	E: The method driver /usr/lib/apt/methods/https could not be found.
    >	N: Is the package apt-transport-https installed?
    >	E: Failed to fetch https://apt.syncthing.net/dists/syncthing/InRelease
    >	```
	>	Install the _'apt-transport-https'_ package first:
	>	```
	>	apt install apt-transport-https && apt update && apt install syncthing
	>	```

4. Start Syncting as user (!):

	```
	$ syncthing
	```

If a _graphical desktop_ is available the web-GUI of Syncthing is displayed to configure (and use) Syncthing from localhost. When syncthing is started from the _CLI_ however (often the case with servers), Syncthing will have to be configured by editing its configuration file directly.

## References

Adapted from: [Syncthing][1]


<!-- REFERENCES -->
[1]:https://apt.syncthing.net/
