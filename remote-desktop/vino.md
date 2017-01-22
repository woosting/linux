# START/STOP FROM CLI

## start:
```
/usr/lib/vino/vino-server &
```


## stop:
```
pkill vino-server
```


## auto-start
Place in auto-start of DE:
```
/usr/lib/vino/vino-server
```



# AUTHENTICATION ISSUE: "No supported authentication methods!"
On server side:
```
gsettings set org.gnome.Vino require-encryption false
```



# CONFIGURATION
```
gnome-control-center
```



# INSTALLATION
```
apt-get install vino
```
