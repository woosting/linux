# Recommended partitionong scheme

## Debian Jessie 8.7 (Desktop)

```
/boot    ¼ -  1 GB - Kernels (250 MB) + rescue cd image (750 MB).
/       10 - 40 GB - Desktop programs
/swap    4 - 24 GB - Hybernation (1.5xRAM)
/tmp*    1 -  5 GB - DVD imaging
/var     5 - 40 GB - Accumulating files (log/web/mail/mysql data)
/home    5 - 80 GB - Rest
-------------------- +
Subtotal:   190 GB
Unallocated  56 GB - To expand LVM volumes later (easier than shrinking)
-------------------- +
TOTAL       246 GB
```

*Mount /tmp with:
 - `nosuid,nodev,noexec` flags (anti hacking)
 - small block size called "news" (less space waste).


# References

- redhat: [Recommended Partitioning Scheme][1]


<!-- REFERENCES -->

[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/s2-diskpartrecommend-ppc.html#id4394007
