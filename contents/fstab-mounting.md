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

    >	With: `mount-point` being the folder to mount the share to.

3. Create a credentials file and open it for editing:

    ```
    # vim /etc/samba/credentials
    ```

4. Populate the file with the cifs credentials:

    ```
    username=<user>
    password=<12345>
    ```

    >	With: `user` being the cifs username.
    >	With: `12345` being the cifs password.

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

    >	With: `192.168.1.100` being the server's IP address (or hostname).
    >	With: `share` being the shared folder (and possibly path to it).
	>	With: `mount-point` being the previously designated folder to mount to.
	>	With: `cifs` declaring the share protocol to be used.
    >	With: `user` declaring regular (non-root) users are allowed to mount.
    >	With: `sec=ntlm` declaring regular security settings should be overridden (for shares using old security protocols).

3. Mount the share to the mount-point:

    ```
    $ mount /mnt/<mount-point>
    ```

    >	Or `# mount all` to mount _every_ share defined in fstab. 
