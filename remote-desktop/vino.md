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



# AUTHENTICATION ISSUE
When receiving a "No supported authentication methods!" message on the client. Execute the following command on the server's side:
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
