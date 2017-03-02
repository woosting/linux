# fstab mounts

Application: To have network share(definitions)s available in GNU/Linux.


## Windows / samba / cifs

Application: To have Microsoft Windows shares available in GNU/Linux:


1. Type: `apt-get install -y cifs-utils` to install Microsoft Windows share tooling.

2. Type: `mkdir /mnt/<nas>` to create a mount-point in the file-tree.

3. Type: `vim /etc/fstab` to open the mount definition file for editing.

4. Append the file with: `//<ipaddress-or-hostname>/<share>/ /mnt/<nas>    cifs    defaults,sec=ntlm,credentials=</etc/samba/credentials> 0 0` (the `sec=ntlm override` is needed for older Microsoft Windows shares, as they use an old security protocol).

5. Type: `mount /mnt/<nas>` to actually mount the share to the mount-point.

```shell
$ apt-get install -y cifs-utils
$ mkdir /mnt/nas
$ vim /etc/fstab

//ipaddress-or-hostname/share/ /mnt/nas    cifs    defaults,sec=ntlm,credentials=/etc/samba/credentials 0 0

$ mount /mnt/nas
```
