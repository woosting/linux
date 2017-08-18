# Steam client installation (Debian 9)

0. Ensure proprietary components are available to Apt (in resources list).

	>	Steam is proprietary, as are most games it manages.

1. Enable 32-bit support:

   ```
   # dpkg --add-architecture i386
   ```
2. Update package index:

   ```
   # apt update
   ```
3. Install Steam:

   ```
   # apt install steam
   ```

## References

> Adapted from: linuxconfig.org
> [How to install Steam client on Debian 9 Stretch Linux][1]

<!-- REFERENCES -->
[1]:https://linuxconfig.org/how-to-install-steam-client-on-debian-9-stretch-linux
