# Mount NFS shares

1. Install NFS tooling: `apt install nfs-common`
  
  ```bash
root@system:~# apt install nfs-common
Reading package lists... Done
Building dependency tree
Reading state information... Done
  
  ...
...
...
  
  invoke-rc.d: initscript nfs-common, action "start" failed.
dpkg: error processing package nfs-common (--configure):
 subprocess installed post-installation script returned error exit status 1
Processing triggers for libc-bin (2.19-18+deb8u9) ...
Processing triggers for systemd (215-17+deb8u7) ...
Errors were encountered while processing:
 nfs-common
E: Sub-process /usr/bin/dpkg returned an error code (1)
root@system:~#
```