# Preferences

## Pinning

In `/etc/sources.list`:

```shell
deb http://ftp.us.debian.org/debian stable main contrib non-free
```

So adding the `contrib` and `non-free` components to the exisiting lines.

In `/etc/apt/preferences`:

```shell
# Disable packages from non-free tree by default
Package: *
Pin: release a=stable,c=non-free
Pin-Priority: -1

# Enable package firmware-iwlfifi from non-free tree
Package: firmware-iwlwifi
Pin: release a=stable,c=non-free
Pin-Priority: 600

# Propriety supporting
Package: *
Pin: release a=stable,c=contrib
Pin-Priority: 600
```

With higher numbered [pin priorities][3] prevailing over the lower ones as explained by `$ man apt_preferences`:

> Priorities (P) assigned in the APT preferences file must be positive or negative integers. They are interpreted as follows (roughly speaking):
>
>  P >= 1000
>     causes a version to be installed even if this constitutes a downgrade of the package
>
> 990 <= P < 1000
>     causes a version to be installed even if it does not come from the target release, unless the installed version is more recent
>
> 500 <= P < 990
>     causes a version to be installed unless there is a version available belonging to the target release or the installed version is more recent
>
> 100 <= P < 500
>     causes a version to be installed unless there is a version available belonging to some other distribution or the installed version is more recent
>
> 0 < P < 100
>     causes a version to be installed only if there is no installed version of the package
>
> P < 0
>     prevents the version from being installed

## Example case

Installing Debian's `firmware-iwlwifi` (intel propriety firmware) package and ONLY that package on a LENOVO T460 from the stretch (testing at the moment of writing) repository, while suppressing all other packages from non-free / stretch:

```shell
# === STABLE ===

# Enable all packages from STABLE main tree by default,
# with a high priority to make it the preferred source:
Package: *
Pin: release a=stable,c=main
Pin-Priority: 900

# ---

# Disable packages from STABLE non-free tree by default:
Package: *
Pin: release a=stable,c=non-free
Pin-Priority: -1

# Disable packages from STABLE contrib tree by default:
Package: *
Pin: release a=stable,c=contrib
Pin-Priority: -1


# === STRETCH ===

# Disable packages from STRETCH by default:
Package: *
Pin: release n=stretch
Pin-Priority: -1

# ---

# Enable package firmware-iwlfifi from STRETCH non-free tree:
Package: firmware-iwlwifi
Pin: release n=stretch,c=non-free
Pin-Priority: 600
```

## References:

- Adapted from (Debian Wiki): [AptPreferences][1]
- Adapted from (APT HOWTO - Obsolete Documentation): [Chapter 3 - Managing packages][2]
- Adapted from (HowtoForge): [A Short Introduction To Apt-Pinning][3]
- Adapted from (ServerFault): [How do I enable non-free packages on Debian?][4]
```

<!-- REFERENCES -->

[1]:https://wiki.debian.org/AptPreferences
[2]:https://www.debian.org/doc/manuals/apt-howto/ch-apt-get.en.html
[3]:https://www.howtoforge.com/a-short-introduction-to-apt-pinning
[4]:http://serverfault.com/a/580700/372187
