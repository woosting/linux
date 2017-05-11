# Syncthing manual installation

1. Grab the [latest (stable) release][1] of Syncthing for your operating system and unpack it. There will be a binary called `syncthing` (or `syncthing.exe` on Windows).

2. Start this in whatever way you are most comfortable with; double-clicking should work in any graphical environment, but I’ll use the terminal to better illustrate what happens. At first start Syncthing will generate a configuration file, some keys and then start the admin GUI in your browser. Something like the following will be printed in the terminal:

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

At this point Syncthing will also have set up a folder called `default` for you, in a directory called `Sync` in your home directory. You can use this as a starting point, then remove it or add more folders later.

The admin GUI starts automatically (if run from a GUI) and remains available on https://localhost:8384/. Cookies are essential to the correct functioning of the GUI; please ensure your browser accepts them.


## References

Adapted from: [Getting Started - Syncthing][2]

<!-- REFERENCES -->
[1]:https://github.com/syncthing/syncthing/releases
[2]:https://docs.syncthing.net/intro/getting-started.html#syncthing
