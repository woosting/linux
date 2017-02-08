# Kill command

## Syntax

```shell
# stop a process
$ kill [-<signal>] <%pid>
```

## Signals

- `-1` or `-SIGHUP` - sends the "Hang Up" signal to processes. This probably originates from the modem/dial-in era. Processes have to be programmed to actually listen to this process and do something with it. Most daemons are programmed to re-read their configuration when they receive such a signal. This is very likely the safest kill signal there is, it should not obstruct anything.
- `-2` or `-SIGINT` - [CTRL]+[C] - Most programs will stop, you could lose data. 
- `-9` or `-SIGKILL` - tells the kernel to let go of the process without informing the process of it. An unclean kill like this could result in data loss. This is the "hardest", "roughest" and most unsafe kill signal available, and should only be used to stop something that seems unstoppable.
- `-15` or `-SIGTERM` - DEFAULT - tells the process to stop whatever it's doing, and end itself. When you don't specify any signal, this signal is used. It should be fairly safe to perform, but better start with a "-1" or "-HUP".


## References

- Adapted from: [The 3 most important "kill" signals on the Linux/UNIX command line][1]
- Also see: [Linux and Unix Signals][4] 
- Also see: [Linux and Unix kill command][5]
- Also see: [How To Kill Processes Using Linux][2]
- Also see: [How To Use ps, kill, and nice to Manage Processes in Linux][3]

<!-- REFERENCES -->

[1]:http://meinit.nl/the-3-most-important-kill-signals-on-the-linux-unix-command-line
[2]:https://www.lifewire.com/how-to-kill-processes-using-linux-4062677
[3]:https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux
[4]:http://www.computerhope.com/unix/signals.htm
[5]:http://www.computerhope.com/unix/ukill.htm
