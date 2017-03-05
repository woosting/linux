# Apt preferences

Application: To have certain packages (from section components) preferred during system upgrades.


## Pinning from non-free

Application: To install one proprietary package from the non-free section component.

1. Type: `vim /etc/sources.list` to open the file for editing.

2. Append the `contrib non-free` section components to the relevant repository lines:

  ```shell
  deb http://ftp.us.debian.org/debian stable main contrib non-free
  ```

3. Type: `vim /etc/apt/preferences` to open (or create) the preferences file and append it with your pinning preferences:

  ```shell
  # Disable PROPRIETARY packages by default
  Package: *
  Pin: release a=stable,c=non-free
  Pin-Priority: -1

  # Disable PROPRIETARY-DEPENDENT packages by default
  Package: *
  Pin: release a=stable,c=contrib
  Pin-Priority: -1

  # ---

  # Enable SPECIFIC PROPRIETARY package (e.g. WiFi firmware in this case)
  Package: firmware-iwlwifi
  Pin: release a=stable,c=non-free
  Pin-Priority: 600
  ```

  With higher [pin priorities][3] prevailing over the lower ones as explained by **man apt_preferences**:

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

[~apt_preferences man page][5]

### Example case

-----

!!! WARNING !!! WARNING !!! WARNING !!!

THIS LEAD TO A BROKEN X on a LENOVO T460

-----

Perform the aforementioned and the following to the **/etc/apt/preferences** file to install Debian's `firmware-iwlwifi` (intel propriety firmware) package and ONLY that package from the stretch (testing at the moment of writing) repository, while suppressing all other packages from non-free and stretch:

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

# Enable WIFI FIRMWARE package from STRETCH non-free tree
Package: firmware-iwlwifi
Pin: release n=stretch,c=non-free
Pin-Priority: 600

# Enable KERNEL package from STRETCH main tree
Package: linux-image*
Pin: release n=stretch,c=main
Pin-Priority: 600
```

And than install with:
```
apt-get install firmware-iwlwifi/stretch linux-image-4.9.0-1-amd64/stretch
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
[5]:https://
