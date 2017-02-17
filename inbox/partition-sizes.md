# Recommended partitionong scheme (Debian Jessie 8.7)

```shell
/boot         1 GB (250 MB for kernels + 750 MB rescue cd image evt.)
/            40 GB (desktop programms)
/swap        24 GB (1.5xRAM because of hybernation)
/tmp*         5 GB (4,4+ GB obecause /tmp is simetimes used for DVD imaging)
/var         40 GB (Accumulating logs, web/mail/mysql data)
/home        80 GB  
------------------ +
subtotal:   190 GB

Unallocated  56 GB (to expand LVM volumes in a later stadium should that be nessesary (easier than shrinking)
------------------ +
TOTAL       246 GB
```

> /tmp is to be mounted with the flags: `nosuid,nodev` and possibly smaller blocksize (called "news"?).


# References

- redhat: [Recommended Partitioning Scheme][1]


<!-- REFERENCES -->

[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/s2-diskpartrecommend-ppc.html#id4394007

