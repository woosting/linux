# Kernel version check

## Read version process file:

```
# cat /proc/version
Linux version 2.6.32-300.10.1.el5uek (mockbuild@ca-build56.us.oracle.com) (gcc version 4.1.2 20080704 (Red Hat 4.1.2-50)) #1 SMP Wed Feb 22 17:37:40 EST 2012
```

> `2.6.32-300.10.1.e15uek` - Kernel distribution version.



## Read issue.net file:

```
# cat /etc/issue.net | head -1
Oracle Linux Server release 5.8
```

> `OEL 5.8` - Release number of distribution.



## Reading release specific file in /etc

```
# cat /etc/enterprise-release OR /etc/oracle-release   ---For OEL
Enterprise Linux Enterprise Linux Server release 5.8 (Carthage)
```

```
# cat /etc/redhat-release         ---For RHEL
Red Hat Enterprise Linux Server release 5.8 (Tikanga)
```

> ALTERNATIVE: Use a wildcard to list any distro.
>
> ```
> # cat /etc/*release
> Red Hat Enterprise Linux Server release 5.8 (Tikanga)
> ```
> `Tikanga` - codename.



## List release package

```
# rpm -qa |grep -i release
oraclelinux-release-5-8.0.2
```


## Issue uname command

```
# uname -r
2.6.18-308.11.1.el5
```


## Issue the release command

```
# lsb_release -a
LSB Version:    :core-4.0-amd64:core-4.0-ia32:core-4.0-noarch:graphics-4.0-amd64:graphics-4.0-ia32:graphics-4.0-noarch:printing-4.0-amd64:printing-4.0-ia32:printing-4.0-noarch
Distributor ID: RedHatEnterpriseServer
Description:    Red Hat Enterprise Linux Server release 5.8 (Tikanga)
Release:        5.8
Codename:       Tikanga
```

## References

> Adapted from: Kerneltalks.com
> [Check Linux kernel version][1]



<!-- REFERENCES -->

[1]:http://kerneltalks.com/config/check-linux-kernel-version/
