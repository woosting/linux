# Hostname change

Change the hostname of a Debian system:

## init.d

1. Open the hostname definition file and update it:

	```
	# vim /etc/hostname
	```

2. Open and update the hosts file correspondingly:

 	```
	# vim /etc/hosts
	```

3. Reboot the system.

## Systemd

Use Systemd to change the hostname:

```
# hostnamectl set-hostname <mymachine>
```

> NOTE: This method depends on dbus so be sure to install that first if it isn't already!

> NOTE: Systemd breaks with the Unix philosophy to keep programs small and _dedicated_ (do one thing, but do it well), instead it takes a "monolithic" approach which is considered highly controversial in the *nix world.

## References

> Adapted from: Debian wiki
[How to change hostname][1] - [PDF][2]


<!-- REFERENCES -->

[1]:https://wiki.debian.org/HowTo/ChangeHostname
[2]:hostname-change_debian-wiki_snapshot.pdf


<!-- NGREP ONELINERS

>>> Change hostname via systemd: # hostnamectl set-hostname <mymachine>

-->
