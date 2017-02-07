# Listings

List all software installed from particular component (non-free, contrib):

```
# search installed packages sorted and filtered on `contrib` or `non-free`
$ dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free

# search available packages from `non-free`
$ aptitude search '~i ?section(non-free)'
```

`Section` will be non-free/... for everything from the non-free path.
