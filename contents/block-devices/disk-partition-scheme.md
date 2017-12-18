# Disk partition scheme

Recommended disk partition sizes to hold typical Debian installations:


## Debian Jessie 8.7 (Desktop)

```
/boot    ¼ -  1 GB   Kernels (250 MB) + rescue cd image (750 MB).
/        8 - 40 GB   Desktop programs
/swap    4 - 24 GB   Hybernation (1.5xRAM)
/tmp*    1 -  5 GB   To be able to hold entire DVD images
/var     3 - 40 GB   Accumulating files (log/web/mail/mysql data)
/home    3 - 80 GB   Rest
-------------------- +
Subtotal:   190 GB
Unallocated  56 GB   To expand LVM volumes later (easier than shrinking)
-------------------- +
TOTAL       246 GB
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
|64GB|At least 4GB|Hibernation not recommended|

## References

> Adapted from: Redhat
> [Recommended Partitioning Scheme][1]


<!-- REFERENCES -->

[1]:https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-disk-partitioning-setup-x86#sect-custom-partitioning-x86
