# Logrotate

To define a log rotation scheme:

1. Create and/or open a rotation scheme file for editing:

	```
	# vim /etc/logrotate.d/<name-of-log>
	```

2. Populate it with:

	```
	/var/log/<name-of-log.log> {
	size 1k
	create 700 root root
	rotate 4
	compress
	}
	```

	> `size 1k` - rotation trigger file size (1k).
	> `create 700 root root` - creation, with user permissions (700), for user (root), and group (root).
	> `rotate 4` - rotation limit (4) / amount of files retained (4).
	> `compress` - compress rolled (previous) log files.

	> ```
	> ALL OPTIONS:
	> ------------
	> compress             --> Compresses all noncurrent versions of the > log file
	> daily,weekly,monthly --> Rotating log files on the specified schedule
	> delaycompress        --> Compresses all versions but current and > next-most-recent
	> endscript            --> Marks the end of a prerotate or postrotate script
	> errors "emailid"     --> Email error notification to specified emailaddr
	> missingok            --> Do not complain if log file is missing
	> notifempty           --> Does not rotate the log file if it is empty
	> olddir "dir"         --> Specifies that older verions of the log file be placed in "dir"
	> postrotate           --> Introduce a script to be run after log has been rotated
	> prerotate            --> Introduce a script to be run before any changes are made
	> rotate 'n'           --> Include 'n' versions of the log in the rotation scheme
	> sharedscripts        --> Runs scripts only once for the entire log group
	> size='logsize'       --> Rotates if log file size > 'logsize (eg 100K, 4M)
	> ```

3. Do a testrun:

	```
	# /usr/sbin/logrotate /etc/logrotate.conf
	```


## References
>	Adapted from: Linuxroutes
>	[Ultimate guide to configure logrotate utility][1]


<!-- REFERENCES -->
[1]:http://www.linuxroutes.com/configure-logrotate/
