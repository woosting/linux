# Apt Listings

List all software installed from a specific component section (non-free, contrib, etc.):

## DPKG

List all installed software:

```
$ dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free
```

>	`sort` - ordering the results.
>	`egrep` - filtering the results on keywords.


## Aptitude

List all installed software:

```
$ aptitude search '~i ?section(non-free)
```

>	`non-free` - limit the search to non-free packages.

<!-- NGREP ONELINERS

>>> List all apt installed packages: $ dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free

-->
