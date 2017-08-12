# Hostname change

Change the hostname of a Debian system:

## init.d

1. Open and update the hostname definition:

	```
	# vim /etc/hostname
	```

2. Open and update the hosts file correspondingly:

 	```
	# vim /etc/hosts
	```

3. Reboot the system.

## Systemd

Use the Systemd "monolith" to change the hostname:

```
# hostnamectl set-hostname <mymachine>
```

> This method depends on dbus so be sure to install that first if it isn't already!

## References
* Adapted from (Debian wiki): [How to change hostname][1]


<!-- REFERENCES -->

[1]:https://wiki.debian.org/HowTo/ChangeHostname
