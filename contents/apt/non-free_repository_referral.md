# Non-free repository referral

1. Open the repository referral file for editing:

	```
	# vim /etc/apt/sources.list
	```

2. Append the lines for the official repositories with the proprietary components (`contrib` and/or `non-free`):

	```
	deb http://ftp.us.debian.org/debian stable main contrib non-free
	```
