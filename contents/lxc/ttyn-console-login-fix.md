# TTYn console login fix

To fix a missing login on TTYs other than TTY 0 on an LXC hosted container.

> Symptoms: `lxc-attach -n <containername>` and `lxc-console -n <countainername> -t 0` (note the tty 0 reference) are functional but _other_ TTYs are not.. (there; input is simply echoed on screen instead).

1. Copy the getty service file (in the container):

	```
	# cp /lib/systemd/system/getty@.service /etc/systemd/system
	```

2. Open the getty service file (in the container) for editing:

	```
	# vim /lib/systemd/system/getty@.service
	```
3. Comment out the line `ConditionPathExists=/dev/tty0` to become:

	```shell
	# ConditionPathExists=/dev/tty0
	```

## References

Adapted from: https://wiki.debian.org/LXC
