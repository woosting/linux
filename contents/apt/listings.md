# Apt Listings

List all software installed from a specific component section (non-free, contrib, etc.):

## dpkg

```
$ dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free
```

>	- `sort`: Order the results.
>	- `egrep`: Filter the results on keywords (in this case:`contrib` or `non-free`).


## Aptitude

```
$ aptitude search '~i ?section(non-free)'
```

>	- `non-free`: Limit search space to non-free packages.
