# LXC container migration

Move or backup LXC containers:

> NOTE: For overlay backed containers the container the new one is based off of should be migrated too.


1. Shutdown the container:

	```
	$ lxc-stop -n <container-name>
	```

2. Archive the container's _rootfs_ & _config_:

	```
	$ tar --numeric-owner -czvf <container-name>.tar.gz -C </path/to/containers-dir> <container>
	```

	> `--numeric-owner` preserving user / group ownerships _numerically_.
	> > NOTE: IMPORTANT for the moved container to function correctly:
	> >
	> > _Without it, the container may not boot because the uid/gids get mangled in the extracted filesystem. When tar creates an archive with that flag raised, it preserves user / group ownership information. By default, when extracting, tar tries to resolve the archive user/group ownership names with the ids on the system running tar. This is intended to ensure that user ownership is resolved on the new system, in case the UID numeric values differ between systems. This is bad for an LXC filesystem because the numeric uid/gid ownership is intended to be preserved for the whole filesystem. If it gets resolved to a different value, bad things happen._
	>
	> ALTERNATIVELY: Ommit de snapshots directory:
	>
	> ```
	> $ tar --numeric-owner -czvf <container-name>.tar.gz -C </path/to/containers-dir> --exclude='radicale/snaps' <container>
	> ```
	>
	> NOTE: Warnings about skipped socket files should be ignorable without issues e.g.: `//tar: /var/lib/lxc/$NAME/rootfs/dev/log: socket ignored//`.

3. Securely copy (scp) the archived container to your new server's lxc-containers directory:

	```
	$ scp <container-name>.tar.gz <user>@<newserver>:</path/to/containers-dir/>
	```

	> `/path/to/containers-dir/` - typically: `/var/lib/lxc/` (on regular GNU/Linux systems)

4. Navigate to to the archived container on the new server.

6. Extract the container to your new server's lxc-containers directory:

	```
	$ tar --numeric-owner -xzvf <container-name>.tar.gz -C </path/to/containers-dir/>
	```

7. Start the container on the new location:

	```
	$ lxc start -n <container-name>
	```


## References

> Adapted from: StackOverflow
> [How do I Backup / Move LXC containers?][1]


<!-- REFERENCES -->

[1]:http://stackoverflow.com/questions/23427129/how-do-i-backup-move-lxc-containers/34194341#34194341


<!-- NGREP ONELINERS

>>> Archive / backup an LXC container: $ tar --numeric-owner -czvf <container-name>.tar.gz -C </path/to/container>

-->
