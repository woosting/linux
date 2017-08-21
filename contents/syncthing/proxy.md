# Proxy

> NOTE: Syncthing can run behind a SOCKS5 proxy. This enables use behind some (corporate) firewalls, tunneling via SSH, and over Tor. The Syncthing instance behind the proxy is limited to outbound connections - it can not listen for incoming connections via the proxy. It is however possible to receive incoming connections via Relaying.
>
> There is no graphical configuration to enable proxy usage in Syncthing. Instead, an environment variable `all_proxy` must be set that points to the proxy. The value of this variable is the proxy URL. Note that this environment variable is _not_ named with capital letters - it must be exactly `all_proxy`. The `Proxy settings detected` log message indicates that Syncthing is using the proxy configuration.

## GNU/Linux

1. Make the environment variable (for he duration of the shell session):

	```
	$ export all_proxy=<proxy-type>://<ip-address>:<port>
	```
	>	EXAMPLE:
	>	```
	>	$ export all_proxy=socks5://10.20.30.40:5060
	>	```

2. Start Syncthing and check the logs for successful proxy detection:

	```
	$ syncthing
	[monitor] 11:25:39 INFO: Starting syncthing
	...
	[monitor] 11:25:40 INFO: Proxy settings detected
	```


## Windows 7

1. Open the environment variable dialog via (either):
	- Computer properties:
	    1. **Right-click on: computer** to open the context menu.
		2. **Choose: properties**.
	    2. **Choose: Advanced system settings** in the left column.
	    3. **Choose [Environment variables...]** to open them.
	- Search:
	    1. **Search for: Environment variables**.
	    2. **Choose either:**
			- **Edit environment variables for your account.**
	      	- **Edit the system environment variables.**
2. Create the environment variable: `all_proxy` and its value.


<!-- NGREP ONELINERS

>>> Syncthing proxy environment variable: $ export all_proxy=<proxy-type>://<ip-address>:<port>

-->
