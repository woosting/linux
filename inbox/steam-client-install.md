# How to install Steam client on Debian 9 Stretch Linux

Steam is proprietary, and the games it manages are too. As a result, you need to enable Debian's `non-free` repository. To do so, open up `/etc/apt/sources.list` as root using your text editor of choice. At the end of the lines for the official Debian repositories add `contrib non-free` after `main`.

1. Enable 32-bit support: 
   ```shell
   sudo dpkg --add-architecture i386
   ```
2. Update package index: 
   ```shell
   sudo apt update
   ```
3. Install Steam: 
   ```shell
   sudo apt install steam
   ```

# References

Adapted from linuxconfig.org: [How to install Steam client on Debian 9 Stretch Linux][1]

<!-- REFERENCES -->
[1]:https://linuxconfig.org/how-to-install-steam-client-on-debian-9-stretch-linux
