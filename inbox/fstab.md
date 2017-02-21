# Windows / samba / cifs

To mount an old (hence the `sec=ntlm override`) samba/cifs/Windows mount:

```shell
$ mkdir /mnt/nas
$ vim /etc/fstab
```

Append `/etc/fstab` it with:

```shell
//ipaddress-or-hostname/share/ /mnt/nas    cifs    defaults,sec=ntlm,credentials=/etc/samba/credentials 0 0
```

```shell
$ mount /mnt/nas
```
