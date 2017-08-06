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

# References

- Redhat: [Recommended Partitioning Scheme][1]



<!-- REFERENCES -->

[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/s2-diskpartrecommend-ppc.html#id4394007
