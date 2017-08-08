# Syncthing configuration from CLI

Syncthing is generally configured from the GUI, but sometimes it is hard to access the GUI when only a CLI is available (often the case with servers) in which case the configuration file is edited directly:

0. Ensure Syncthing is not running.

1. Open the configuration.xml for editing:

	```
	vim ~/.config/syncthing/config.xml
	```

    > If a config.xml does not exist yet (an empty file is presented) first start (and stop) syncthing as the user that is to run Syncthing!

2. Locate: `<address>127.0.0.1:8384</address>` and change it into `<address>0.0.0.0:8384</address>`

3. Save the file.

4. Use your desktop webbroswer and surf to: `<syncthing.server.ip.address>:8384`

The remaining configuration can be done from the web/interface.


## References

The official: [Syncthing Configuration][1]


<!-- REFERENCES -->
[1]:https://docs.syncthing.net/users/config.html
