# Syncthing installation via apt

> As of Debian 9 (Stretch) syncthing is available from default repositories and can thus simply be installed by issuing: `apt install syncthing`; probably making this how-to obsolete (NEEDS TESTING).

1. Add the release PGP keys: `curl -s https://syncthing.net/release-key.txt | apt-key add -`

2. Add the "stable" channel to your APT sources: `echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list`

3. Update Apt and install syncthing: `apt update && apt install syncthing`

    > In case you get any or all of the following messages (dependent on your distribution), install *'apt-transport-https'* package first: `apt install apt-transport-https && apt update && apt install syncthing`
    >
    >```
    >E: The method driver /usr/lib/apt/methods/https could not be found.
    >N: Is the package apt-transport-https installed?
    >E: Failed to fetch https://apt.syncthing.net/dists/syncthing/InRelease
    >```
    
4. Start Syncting as user (!): `syncthing`

If a desktop is available the web-GUI of Syncthingis displayed to configure (and use) Syncthing from localhost.

When syncthing is started from the CLI without a desktop present (often the case with servers), Syncthing will have to be configured by editing its configuration file directly.

## References

Adapted from: [Syncthing][1]


<!-- REFERENCES -->
[1]:https://apt.syncthing.net/
