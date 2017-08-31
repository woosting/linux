# Start Syncthing on Debian boot using init.d

Syncthing is a great, open-source, decentralized file sync application available for a wide range of platforms (Windows, Linux, Mac, Android, OpenBSD...). Its installation on _Debian / Ubuntu_ is simple and well [documented][2]. There is also general documentation for [installing and configuring Synthing][3] and how to [automatically start Syncthing][4]. However, there is one thing that the current documentation does not cover, and that is how to start Syncthing on boot with init.d:


## Create the startup script

1. Create and/or open a file to form a startup script:

	```
	$ vim /etc/init.d/syncthing
	```

2. Populated it with the following code:

	```shell
	#! /bin/sh

	# Author: Liam <cuonic@cuonic.com>
	#
	# Please remove the "Author" lines above and replace them
	# with your own name if you copy and modify this script.

	# Do NOT "set -e"

	# PATH should only include /usr/* if it runs after the mountnfs.sh script
	PATH=/sbin:/usr/sbin:/bin:/usr/bin
	DESC="Syncthing decentralized file sync platform"
	NAME=syncthing
	DAEMON=/usr/bin/$NAME
	DAEMON_ARGS=""
	PIDFILE=/var/run/$NAME.pid
	SCRIPTNAME=/etc/init.d/$NAME
	USER=cuonic

	# Exit if the package is not installed
	[ -x "$DAEMON" ] || exit 0

	# Read configuration variable file if it is present
	[ -r /etc/default/$NAME ] && . /etc/default/$NAME

	# Load the VERBOSE setting and other rcS variables
	. /lib/init/vars.sh

	# Define LSB log_* functions.
	# Depend on lsb-base (>= 3.2-14) to ensure that this file is present
	# and status_of_proc is working.
	. /lib/lsb/init-functions

	#
	# Function that starts the daemon/service
	#
	do_start()
	{
	  # Return
	  #   0 if daemon has been started
	  #   1 if daemon was already running
	  #   2 if daemon could not be started
	  start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --chuid $USER --background --test > /dev/null \
	      || return 1
	  start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON --chuid $USER --background -- \
	      $DAEMON_ARGS \
	      || return 2
	}

	#
	# Function that stops the daemon/service
	#
	do_stop()
	{
	  # Return
	  #   0 if daemon has been stopped
	  #   1 if daemon was already stopped
	  #   2 if daemon could not be stopped
	  #   other if a failure occurred
	  start-stop-daemon --stop --quiet --retry=TERM/30/KILL/5 --pidfile $PIDFILE --chuid $USER --name $NAME
	  RETVAL="$?"
	  [ "$RETVAL" = 2 ] && return 2
	  # Wait for children to finish too if this is a daemon that forks
	  # and if the daemon is only ever run from this initscript.
	  # If the above conditions are not satisfied then add some other code
	  # that waits for the process to drop all resources that could be
	  # needed by services started subsequently.  A last resort is to
	  # sleep for some time.
	  start-stop-daemon --stop --quiet --oknodo --retry=0/30/KILL/5 --chuid $USER --exec $DAEMON
	  [ "$?" = 2 ] && return 2
	  # Many daemons don't delete their pidfiles when they exit.
	  rm -f $PIDFILE
	  return "$RETVAL"
	}

	#
	# Function that sends a SIGHUP to the daemon/service
	#
	do_reload() {
	  #
	  # If the daemon can reload its configuration without
	  # restarting (for example, when it is sent a SIGHUP),
	  # then implement that here.
	  #
	  start-stop-daemon --stop --signal 1 --quiet --pidfile $PIDFILE --chuid $USER --name $NAME
	  return 0
	}

	case "$1" in
	start)
	  [ "$VERBOSE" != no ] && log_daemon_msg "Starting $DESC" "$NAME"
	  do_start
	  case "$?" in
	      0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
	      2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
	  esac
	  ;;
	stop)
	  [ "$VERBOSE" != no ] && log_daemon_msg "Stopping $DESC" "$NAME"
	  do_stop
	  case "$?" in
	      0|1) [ "$VERBOSE" != no ] && log_end_msg 0 ;;
	      2) [ "$VERBOSE" != no ] && log_end_msg 1 ;;
	  esac
	  ;;
	status)
	  status_of_proc "$DAEMON" "$NAME" && exit 0 || exit $?
	  ;;
	#reload|force-reload)
	  #
	  # If do_reload() is not implemented then leave this commented out
	  # and leave 'force-reload' as an alias for 'restart'.
	  #
	  #log_daemon_msg "Reloading $DESC" "$NAME"
	  #do_reload
	  #log_end_msg $?
	  #;;
	restart|force-reload)
	  #
	  # If the "reload" option is implemented then remove the
	  # 'force-reload' alias
	  #
	  log_daemon_msg "Restarting $DESC" "$NAME"
	  do_stop
	  case "$?" in
	    0|1)
	      do_start
	      case "$?" in
	          0) log_end_msg 0 ;;
	          1) log_end_msg 1 ;; # Old process is still running
	          *) log_end_msg 1 ;; # Failed to start
	      esac
	      ;;
	    *)
	      # Failed to stop
	      log_end_msg 1
	      ;;
	  esac
	  ;;
	*)
	  #echo "Usage: $SCRIPTNAME {start|stop|restart|reload|force-reload}" >&2
	  echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
	  exit 3
	  ;;
	esac

	:
	```

3. Change the line: `USER=cuonic` to: `USER=<username>` you want the script to run as.

4. Make the script executable:

	```
	$ chmod 755 /etc/init.d/syncthing
	```

5. Make init.d aware of the script:

	```
	$ update-rc.d syncthing defaults
	```

## Test the startupscript

1. Test the START routine:

	```
	$ service syncthing start
	```

2. Test the STATUS routine:

	```shell
	$ service syncthing status
	```

3. Test the STOP routine:

	```shell
	$ service syncthing stop
	```

## References
> Adapted from: Cuonic (Liam Jack)
> [How to start Syncthing on Debian boot][1]


<!-- REFERENCES -->
[1]:https://cuonic.com/posts/how-to-start-syncthing-on-debian-boot
[2]:https://apt.syncthing.net/
[3]:https://docs.syncthing.net/intro/getting-started.html
[4]:https://docs.syncthing.net/users/autostart.html?highlight=starting
