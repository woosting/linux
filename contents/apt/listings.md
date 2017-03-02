# Apt Listings

Application: List all software installed from a particular component section (non-free, contrib, etc.):

- Type: `dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free` to have **dpkg** search for installed packages, **sort** the result and have it filtered on **contrib** or **non-free** packages.

- Type: `aptitude search '~i ?section(non-free)'` to have **aptitude search** packages available in the **non-free** section.

```shell
# search installed packages sorted and filtered on `contrib` or `non-free`
$ dpkg-query -W -f='${Section}\t${Package}\n' | sort | egrep ^contrib\|^non-free

# search available packages from `non-free`
$ aptitude search '~i ?section(non-free)'
```

**Section** will be **non-free/...** for everything from the non-free path.
