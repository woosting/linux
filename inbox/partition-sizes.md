# Recommended partitionong scheme

## Debian Jessie 8.7 (Desktop)

```
/boot         1 GB - Kernels (250 MB) + rescue cd image (750 MB).
/            40 GB - Desktop programs, otherwise 10-20 GB.
/swap        24 GB - Hybernation (1.5xRAM), otherwise 4 GB minimum.
/tmp*         5 GB - DVD imaging, otherwise 1 GB is sufficient.
/var         40 GB - Accumulating files: log/web/mail/mysql data, 5 GB minimum
/home        80 GB - Rest
------------------ +
Subtotal:   190 GB
Unallocated  56 GB (to expand LVM volumes with later (easier than shrinking)
------------------ +
TOTAL       246 GB
```

*Mount /tmp with:
 - `nosuid,nodev` flags (anti hacking)
 - small block size called "news" (less space waste).


# References

- redhat: [Recommended Partitioning Scheme][1]


<!-- REFERENCES -->

[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/s2-diskpartrecommend-ppc.html#id4394007
