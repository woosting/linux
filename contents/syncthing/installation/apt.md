# Syncthing installation via apt

***Note:** As of Debian 9 (Stretch) syncthing is available from default repositories and can thus simply be installed by issuing: `apt install syncthing`; probably making this how-to obsolete (NEEDS TESTING).*

1. Add the release PGP keys (as root):
    ```shell
    curl -s https://syncthing.net/release-key.txt | apt-key add -
    ```

2. Add the "stable" channel to your APT sources (as root):
    ```shell
    echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list
    ```

3. Update* Apt and install syncthing (as root):
    ```shell
    apt update && apt install syncthing
    ```
    *Depending on your distribution, you may see an error similar to the following when running apt:

    >```
    >E: The method driver /usr/lib/apt/methods/https could not be found.
    >N: Is the package apt-transport-https installed?
    >E: Failed to fetch https://apt.syncthing.net/dists/syncthing/InRelease
    >```

    If so, install the apt-transport-https package and try again (as root):
    ```shell
    apt install apt-transport-https && apt update && apt install syncthing
    ```
    
4. Start Syncting (as user):
    ```shell
    syncthing
    ```
    ***Note:** If a desktop is available Syncthing web-gui is displayed from localhost. This GUI that can subsequently be used to configure Syncthing. However, when syncthing is started from the CLI without a desktop present, Syncthing will have to be configured by editing its configuration file directly*

## References

Adapted from: [Syncthing][1]


<!-- REFERENCES -->
[1]:https://apt.syncthing.net/
