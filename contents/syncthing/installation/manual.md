# Syncthing manual installation

1. Grab the [latest (stable) release][1] of Syncthing for your operating system:

	```
	```

2. Unpack it:
	```
	```
	> There will be a binary called `syncthing` (or `syncthing.exe` on Ms. Windows).

2. Start the executable (double-clicking it in a graphical environment should work, but using a CLI terminal better illustrates what happens):

	```
	$ syncthing
	[monitor] 15:56:58 INFO: Starting syncthing
	15:56:58 INFO: Generating RSA key and certificate for syncthing...
	[ANSMX] 15:57:05 INFO: syncthing v0.10.14 (go1.4 darwin-amd64 default) jb@syno...
	[ANSMX] 15:57:05 INFO: My ID: ANSMXYD-E6CF3JC-TCVPYGF-GXJPHSJ-MKUXBUQ-ZSPOKXH-...
	[ANSMX] 15:57:05 INFO: No config file; starting with empty defaults
	[ANSMX] 15:57:05 INFO: Edit gs1/config.xml to taste or use the GUI
	[ANSMX] 15:57:05 INFO: Starting web GUI on http://127.0.0.1:8384/
	[ANSMX] 15:57:05 INFO: Loading HTTPS certificate: open gs1/https-cert.pem: no ...
	[ANSMX] 15:57:05 INFO: Creating new HTTPS certificate
	[ANSMX] 15:57:05 INFO: Generating RSA key and certificate for syno...
	[ANSMX] 15:57:07 INFO: Starting UPnP discovery...
	[ANSMX] 15:57:13 INFO: UPnP discovery complete (found 0 devices).
	[ANSMX] 15:57:13 INFO: Starting local discovery announcements
	[ANSMX] 15:57:13 INFO: Local discovery over IPv4 unavailable
	[ANSMX] 15:57:13 INFO: Starting global discovery announcements
	[ANSMX] 15:57:13 OK: Ready to synchronize default (read-write)
	[ANSMX] 15:57:13 INFO: Device ANSMXYD-E6CF3JC-TCVPYGF-GXJPHSJ-MKUXBUQ-ZSPOKXH-...
	[ANSMX] 15:57:13 INFO: Completed initial scan (rw) of folder default
	```

	> First Syncthing generates a configuration file, some keys and then starts the admin GUI in a browser; remaining available on: https://localhost:8384/
	>
	> Cookies are essential for GUI functionality!

At this point Syncthing will also have set up a folder called `default` for you, in a directory called `Sync` in your home directory. You can use this as a starting point, then remove it or add more folders later.


## References

Adapted from: [Getting Started - Syncthing][2]

<!-- REFERENCES -->
[1]:https://github.com/syncthing/syncthing/releases
[2]:https://docs.syncthing.net/intro/getting-started.html#syncthing
