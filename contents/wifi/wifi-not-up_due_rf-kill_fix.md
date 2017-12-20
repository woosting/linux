# WiFi: operation not possible due to RF-kill

The problem seems to be a bug in a kernel module, which prevents the [rfkill's soft and hard block][1] from syncing correctly.

In practice that means you can press your laptop's WiFi button as often as you want, it doesn't change anything. Your wireless adapter will always appear as disabled. If you try to start the wireless interface manually you get the following error message:

```
user@host:~# ifconfig wlan0 up
SIOCSIFFLAGS: Operation not possible due to RF-kill
```
If you do a `rfkill list all` you should get an output similar to this:
```
user@host:~$ sudo rfkill list all
0: hp-wifi: Wireless LAN
Soft blocked: yes
Hard blocked: no
1: phy0: Wireless LAN
Soft blocked: yes
Hard blocked: no
```
Depending on the state of your WiFi button the **Hard blocked** will either be **yes** or **no**. Press the WiFi button and run `rfkill list all` again to make sure the value for **Hard blocked** changes.

The actual problem is, that the **Soft blocked** value is always set to **yes**, because for some reason the syncing between the hardware block and the software block doesn't work as supposed. To override this behavior, you can just run `rfkill unblock wifi` and it should work again. Double check by entering `rfkill list all` again and make sure it looks like this, with all values set to **no**:
```
user@host:~$ sudo rfkill list all
0: hp-wifi: Wireless LAN
Soft blocked: no
Hard blocked: no
1: phy0: Wireless LAN
Soft blocked: no
Hard blocked: no
```
If you then run `ifconfig wlan0 up` (or enable the wireless via your desktop's network manager) you should be able to connect to a wireless network again without any further issues.

I also read, that some people could fix it, by turning off the WiFi button during the boot process and then switch it on again, once the system is up and running. It seems that the system expects the hard block to be set to off. This is still a bug, but it could explain why then the soft block didn't sync with the hard block any more.

# References

> Adapted from: Geek mind
> [Linux WiFi: operation not possible due to RF-kill][2]

<!-- REFERENCES -->
[1]: https://www.mjmwired.net/kernel/Documentation/rfkill.txt
[2]: http://www.geekmind.net/2011/01/linux-wifi-operation-not-possible-due.html

<!-- NGREP ONELINERS
>>> Un block WiFi: $ rfkill unblock wifi
>>> WiFi block status: $ fkill list all
-->
