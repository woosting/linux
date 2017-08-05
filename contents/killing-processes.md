# Killing processes

APPLICATION: Stop rogue/frozen processes.

Stop a program:

```
$ kill 2443
```

> With:
>
> - `2443` being the process id that is to be stopped.

> Syntax:
>
> `kill [-<signal>] <%pid>`
>
> - `-SIGHUP` / `-1` - The **HUP** signal is sent to a process when its controlling terminal is closed. It was originally designed to notify the process of a serial line drop (HUP stands for "Hang Up"). In modern systems, this signal usually means that the controlling pseudo or virtual terminal has been closed.
-- Processes have to be programmed to actually listen to this process and do something with it. Most daemons are programmed to re-read their configuration when they receive such a signal. This is very likely the safest kill signal there is, it should not obstruct anything.
>
> - `-SIGINT` / `-2` / `[CTRL]+[C]` - The **INT** signal is sent to a process by its controlling terminal when a user wishes to _interrupt_ the process. This is typically initiated by pressing Control-C, but on some systems, the "delete" character or "break" key can be used.
-- Most programs will stop, you could lose data.
>
> - `-SIGKILL` / `-9` - The **KILL** signal is sent to a process to cause it to terminate immediately. In contrast to SIGTERM and SIGINT, this signal cannot be caught or ignored, and the receiving process cannot perform any clean-up upon receiving this signal.
-- The kernel lets go of the process without informing the process of it. An unclean kill like this could result in data loss. This is the "hardest", "roughest" and most unsafe kill signal available, and should only be used to stop something that seems unstoppable.
>
> - `-15` or `-SIGTERM` / DEFAULT - The **TERM** signal is sent to a process to request its termination. Unlike the KILL signal, it can be caught and interpreted or ignored by the process. This allows the process to perform nice termination releasing resources and saving state if appropriate. It should be noted that SIGINT is nearly identical to SIGTERM.
-- It tells the process to stop whatever it's doing, and end itself. When you don't specify any signal, this signal is used. It should be fairly safe to perform, but better start with a "-1" or "-HUP".


## References

- Adapted from: [The 3 most important "kill" signals on the Linux/UNIX command line][1]
- Adapted from: [Linux and Unix kill command][5]
- Also see: [Linux and Unix Signals][4]
- Also see: [How To Kill Processes Using Linux][2]
- Also see: [How To Use ps, kill, and nice to Manage Processes in Linux][3]

<!-- REFERENCES -->

[1]:http://meinit.nl/the-3-most-important-kill-signals-on-the-linux-unix-command-line
[2]:https://www.lifewire.com/how-to-kill-processes-using-linux-4062677
[3]:https://www.digitalocean.com/community/tutorials/how-to-use-ps-kill-and-nice-to-manage-processes-in-linux
[4]:http://www.computerhope.com/unix/signals.htm
[5]:http://www.computerhope.com/unix/ukill.htm
