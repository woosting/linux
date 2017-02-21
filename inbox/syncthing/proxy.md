Syncthing can run behind a SOCKS5 proxy. This enables use behind some corporate firewalls, tunneling via SSH, and over Tor. The Syncthing instance that is behind the proxy is limited to outbound connections - it can not listen for incoming connections via the proxy. It is however possible to receive incoming connections via Relaying.

There is no graphical configuration to enable proxy usage in Syncthing. Instead, an environment variable `all_proxy` must be set that points to the proxy. The value of this variable is the proxy URL. For example, on a Linux-like system:

```shell
$ export all_proxy=socks5://10.20.30.40:5060
$ syncthing
[monitor] 11:25:39 INFO: Starting syncthing
...
[monitor] 11:25:40 INFO: Proxy settings detected
```

> Note that this environment variable is _not_ named with capital letters - it must be exactly `all_proxy`. The `Proxy settings detected` log message indicates that Syncthing is using the proxy configuration.

# Windows 7 procedure

## Via Computer properties
1. Open properties of the computer via its context menu (right-click on **computer**).
2. In the left column choose: **Advanced system settings**
3. Open the Environment variables by clicking: **[Environment variables...]**

## Via search:
1. Search for `Environment variables`
2. Choose either:
  - `Edit environment variables for your account`
  - `Edit the system environment variables`
