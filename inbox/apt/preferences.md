## Preferences (pinning)

In /etc/sources.list:

```shell
deb http://ftp.us.debian.org/debian stable main contrib non-free
```

So adding the `contrib` and `non-free`.

In /etc/apt/sources.list:

```shell
# Disable packages from non-free tree by default
Package: *
Pin: release a=stable,c=non-free
Pin-Priority: -1

# Enable package firmware-iwlfifi from non-free tree
Package: *
Pin: release a=stable,c=contrib
Pin-Priority: 600

# Propriety supporting
Package: *
Pin: release a=stable,c=non-free
Pin-Priority: 600
```

With higher numbered [pin priorities][3] prevailing over the lower ones, and:

- `P > 1000` causing a version to be installed even if this constitutes a downgrade of the package.
- `990 < P <=1000` causing a version to be installed even if it does not come from the target release, unless the installed version is more recent.
- `500 < P <=990` causing a version to be installed unless there is a version available belonging to the target release or the installed version is more recent.
- `100 < P <=500` causing a version to be installed unless there is a version available belonging to some other distribution or the installed version is more recent.
- `0 < P <=100` causing a version to be installed only if there is no installed version of the package.
- `P < 0` preventing the version from being installed.


## References:

- Adapted from (Debian Wiki): [AptPreferences][1]
- Adapted from (APT HOWTO - Obsolete Documentation: [Chapter 3 - Managing packages][2]


<!-- REFERENCES -->

[1]:https://wiki.debian.org/AptPreferences
[2]:https://www.debian.org/doc/manuals/apt-howto/ch-apt-get.en.html
[3]:https://www.howtoforge.com/a-short-introduction-to-apt-pinning
