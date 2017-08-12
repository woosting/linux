# Lid closing

## Ignore lid switch

1. Open the Systemd login configuration file for editing:

	```
	vim /etc/systemd/logind.conf
	```

2. Set the configuration setting to ignore the lid switch:

	```
	...
	HandleLidSwitch=ignore
	...
	```

3. Reboot the system.
