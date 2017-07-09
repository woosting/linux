# Console login fix

## Issue description

I _can_: `lxc-attach -n <containername>` _and_ `lxc-console -n <countainername> -t 0` (note the tty 0 reference) but _not_ on any of the _other_ TTYs... I simply get no login and my commands are echoed to the screen.

## Fix

In the guest (container):

1. CLI: `cp /lib/systemd/system/getty@.service /etc/systemd/system`

2. Edit: `/lib/systemd/system/getty@.service` and #comment out the line:

```
ConditionPathExists=/dev/tty0
```

to become:

```
#ConditionPathExists=/dev/tty0
```

Source: https://wiki.debian.org/LXC
