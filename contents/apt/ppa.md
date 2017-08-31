# PPA

## Listing

```
apt-cache policy
```

## Removal and roll back (Debian)

If you’re a Ubuntu user, you may be familiar with [ppa-purge][2]. It’s a handy little automated script to remove a PPA and roll back the version of any apps installed from that PPA. Debian doesn’t have this nicety by default but there’s a relatively simple way to get something close:

1. Remove the PPA from `/etc/apt/sources.list` or `/etc/apt/sources.list.d/` directory:

	```
	# rm /etc/apt/sources.list.d/<ppa>
	```

2. Update the Apt database:

	```
	# apt update
	```

3. Find any packages that are now obsolete:

	```
	# aptitude search '?obsolete'
	```

4. Remove the listed obsolete packages:

	```
	# apt purge <package>
	```

5. Remove leftover dependencies:

	```
	# apt-get autoremove
	```

6. Reinstall as necessary:

	```
	# apt install <package>
	```

It’s not quite the automated tool that ppa-purge is, but it’s a pretty good start.

## References

> Adapted from: Stackoverflow
> [How to get a list of repositories apt get is checking][1]

> Adapted from: Flinsarmy
> [Remove a ppa and roll back changes in Debian][3]

<!-- REFERENCES -->

[1]:https://stackoverflow.com/questions/8647454/how-to-get-a-list-of-repositories-apt-get-is-checking
[2]:https://askubuntu.com/questions/307/how-can-ppas-be-removed
[3]:https://www.flynsarmy.com/2012/05/remove-a-ppa-and-roll-back-changes-in-debian/
