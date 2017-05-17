# Syncthing configuration from CLI

Syncthing is generally configured from the GUI, but sometimes it is hard to access the GUI on localhost when only a CLI is available (often the case with servers). In that case do the following:

1. Open the configuration.xml for editing using your text/xml editor of choice:

    ```shell
    vim ~/.config/syncthing/config.xml
    ```

2. Locate:
```
    <address>localhost:8384</address>
```

and change it into:

```
    <address>0.0.0.0:8384</address>
```

3. Save the file.

4. Browse to: `syncthing.server.ip.address:8384` and configure the rest using its GUI.


## References

The official: [Syncthing Configuration][1]


<!-- REFERENCES -->
[1]:https://docs.syncthing.net/users/config.html
