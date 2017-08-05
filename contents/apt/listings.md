# Apt Listings

APPLICATION: List all software installed from a particular component section (non-free, contrib, etc.):

## dpkg

```shell
$ dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free
```

> With:
> - `dpkg` being the program to search with.
> - `sort` to order the results.
> - `egrep` to filter the results on the keywords: `contrib` or `non-free`.


## Aptitude

```shell
$ aptitude search '~i ?section(non-free)'
```

> With:
> - `Aptitude` being the program to search with.
> - `non-free` to limit the search space to the non-free section.
