# fstab mounts

Make network share(definitions)s available in GNU/Linux using the 'file system table' fstab:


## Cifs (Windows / samba)

1. Install cifs tooling:

    ```
    # apt install -y cifs-utils
    ```

2. Create a target directory in the file-tree as the mount-point:

    ```
    # mkdir /mnt/<mount-point>
    ```

	>	`mount-point` - folder to mount the share to.

3. Create a credentials file and open it for editing:

    ```
    # vim /etc/samba/credentials
    ```

4. Populate the file with the cifs credentials:

    ```
    username=<user>
    password=<12345>
    ```

	> `user` - cifs username
    > `12345` - cifs password

1. Make the credential file read only:

    ```
    # chmod 700 /etc/samba/credentials
    ```

4. Open the mount definition file for editing:

    ```
    # vim /etc/fstab
    ```

5. Append the file with the a line defining the mount (settings):

    ```
    //<192.168.1.100>/<share>/	/mnt/<mount-point>	cifs	user,sec=ntlm,credentials=/etc/samba/credentials	0	0
    ```

    >	`192.168.1.100` - server's IP address or hostname.
    >	`share` - remote folder on the server (and possibly path to it).
	>	`mount-point` - local folder to mount to.
	>	`cifs` - share protocol to be used.
    >	`user` - allowing regular (non-root) users to mount.
    >	`sec=ntlm` - overriding regular security settings (using old protocols).

3. Mount the share to the mount-point:

    ```
    $ mount /mnt/<mount-point>
    ```

    >	Or mount _every_ share defined in fstab:
	>
	>	```
	>	# mount all
	>	```


<!-- NGREP ONELINERS

>>> Cifs / samba client toolign: cifs-utils

-->
