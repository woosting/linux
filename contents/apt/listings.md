# Apt Listings

List all software installed from a specific component section (non-free, contrib, etc.):

## dpkg

```
$ dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free
```

> With:
>	`sort` ordering the results.
>	`egrep` filtering the results on keywords (in this case:`contrib` or `non-free`).


## Aptitude

```
$ aptitude search '~i ?section(non-free)
```

>	With:
>	`non-free` declaring the search space limit to non-free packages.
