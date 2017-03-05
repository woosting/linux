Syncthing can run behind a SOCKS5 proxy. This enables use behind some corporate firewalls, tunneling via SSH, and over Tor. The Syncthing instance that is behind the proxy is limited to outbound connections - it can not listen for incoming connections via the proxy. It is however possible to receive incoming connections via Relaying.

There is no graphical configuration to enable proxy usage in Syncthing. Instead, an environment variable `all_proxy` must be set that points to the proxy. The value of this variable is the proxy URL. Note that this environment variable is _not_ named with capital letters - it must be exactly `all_proxy`. The `Proxy settings detected` log message indicates that Syncthing is using the proxy configuration.

# Linux procedure

Issue: `export all_proxy=<proxy-type>://<ip-address>:<port>` to make the environment variable (for the shell session):

  ```shell
  $ export all_proxy=socks5://10.20.30.40:5060
  $ syncthing
  [monitor] 11:25:39 INFO: Starting syncthing
  ...
  [monitor] 11:25:40 INFO: Proxy settings detected
  ```


# Windows 7 procedure

1. Open the environment variable dialog via (either):
  - **Computer properties:**
    1. Open properties of the computer via its context menu (right-click on **computer**).
    2. In the left column choose: **Advanced system settings**.
    3. Open the Environment variables by clicking: **[Environment variables...]**.
  - **Search:**
    1. Search for `Environment variables`.
    2. Choose either:
      - `Edit environment variables for your account`.
      - `Edit the system environment variables`.
2. Create the environment varianle: `all_proxy` and its value.
