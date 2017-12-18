# Disk partition scheme

Recommended disk partition sizes to hold typical Debian installations:


## Debian Jessie 9.3 (Desktop)

```
/boot    ¼  -   1  -   1 GB   Kernels (250 MB) + rescue cd image (750 MB).
/       10  -  20  -  40 GB   Desktop programs
/swap    4  -  12  -  24 GB   Hybernation (1.5xRAM)
/tmp*    1  -   5  -   5 GB   To be able to hold entire DVD images
/var     3  -   8  -  32 GB   Accumulating files (apt/log/web/mail/mysql data)
/home    5  -  74  -  80 GB   Rest
--------------------------- +
Sub:    24  - 120  - 190 GB
         8  -  40  -  64 GB   Unalocated to be able to expand LVM volumes later (easier than shrinking)
-------------------- +
TOTAL   32  - 160  - 256 GB
```

```
*Mount with: `nosuid,nodev,noexec`
```

## Swap advice:
|Amount of RAM in the system|Recommended swap space|Recommended swap space if allowing for hibernation|
|---|---|---|
|less than 2GB|2x RAM amount|3x RAM amount|
|2GB – 8GB|equal to RAM amount|2x RAM amount|
|8GB – 64GB|4GB to 0.5x RAM amount|1.5x RAM amount|
|more than 64GB|At least 4GB|Hibernation not recommended|

## References

> Adapted from: Redhat
> [Recommended Partitioning Scheme][1]


<!-- REFERENCES -->

[1]:https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-disk-partitioning-setup-x86#sect-custom-partitioning-x86
