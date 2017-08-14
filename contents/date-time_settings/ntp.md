# Network Time Protocol (NTP)

> Time Protocol (NTP) is a networking protocol for clock synchronization between computer systems over networks. ~ [Wikipedia][1]

1. Install ntp:

	```
	$ apt install ntp
	```

2. Copy the corresponding local ntp server list from: [local sources archive][2]/[continent][3]/[country][4].

3. Open the ntp configuration file for editing:

    ```
    $ vim /etc/ntp.conf
    ```
4. Change the `server pool.ntp.org` line to `server <XX>.pool.ntp.org`:

	```shell
	# pool: <http://www.pool.ntp.org/join.html>
	server 0.<XX>.pool.ntp.org
	server 1.<XX>.pool.ntp.org
	server 2.<XX>.pool.ntp.org
	server 3.<XX>.pool.ntp.org
	```

  	> With: `XX` being your continent or two letter country code (obtained from the local sources archive).

5. Check whether the time is indeed correct now:

	```
	$ date
	Wed, Feb 15, 2017 10:30:18 AM
	```

## REFERENCES
Adapted from: [NTP - Debian Wiki][5]

<!-- REFERENCES -->

[1]:https://en.wikipedia.org/wiki/Network_Time_Protocol
[2]:http://www.pool.ntp.org/zone/@
[3]:http://www.pool.ntp.org/zone/europe
[4]:http://www.pool.ntp.org/zone/nl
[5]:https://wiki.debian.org/NTP
