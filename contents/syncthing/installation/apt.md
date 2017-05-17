# Syncthing installation via apt

> As of Debian 9 (Stretch) syncthing is available from default repositories and can thus simply be installed by issuing: `apt install syncthing`; probably making this how-to obsolete (NEEDS TESTING).

1. Add the release PGP keys, root@hostname:#
    ```shell
    curl -s https://syncthing.net/release-key.txt | apt-key add -
    ```

2. Add the "stable" channel to your APT sources:
    ```shell
    echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list
    ```

3. Update* and install syncthing:

`apt update && apt install syncthing`

*Depending on your distribution, you may see an error similar to the following when running apt-get:

```
E: The method driver /usr/lib/apt/methods/https could not be found.
N: Is the package apt-transport-https installed?
E: Failed to fetch https://apt.syncthing.net/dists/syncthing/InRelease
```

If so, please install the apt-transport-https package and try again:

`apt install apt-transport-https`


## References

Adapted from: [Syncthing][1]


<!-- REFERENCES -->
[1]:https://apt.syncthing.net/
