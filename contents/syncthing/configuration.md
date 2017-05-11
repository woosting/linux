# Syncthing configuration

Syncthing is generally configured from the GUI, but from commandline the configuration can be found at:

`vim ~/.config/syncthing/config.xml`

To make the GUI accessible in that case, as it is hard to access the GUI on localhost when only a CLI is available (often the case with servers), find the section labled:

```
    <address>localhost:8384</address>
```

and change it into:

```
    <address>0.0.0.0:8384</address>
```
