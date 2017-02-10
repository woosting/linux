# Migrate (move) or backup (store) LXC containers

## Procedure

1. Shutdown the container:

 ```shell
$ lxc-stop -n $NAME
```

2. Archive container rootfs & config:

  ```shell
$ cd /var/lib/lxc/$NAME/
$ tar --numeric-owner -czvf <container_fs>.tar.gz ./
```

3. Copy the file to your new server:

  ```shell
$ rsync -avh <container_fs>.tar.gz user@newserver:/var/lib/lxc/
```

4. Extract rootfs:

  ```shell
$ mkdir /var/lib/lxc/$NAME/
$ cd /var/lib/lxc/$NAME/
$ tar --numeric-owner -xzvf <container_fs>.tar.gz ./
```

5. Start the container on the new location
  ```shell
$ lxc start -n $NAME
```

## Notes

- The `--numeric-owner` flag is very important! Without it, the container may not boot because the uid/gids get mangled in the extracted filesystem. When tar creates an archive with that flag raised, it preserves user / group ownership information. By default, when extracting, tar tries to resolve the archive user/group ownership names with the ids on the system running tar. This is intended to ensure that user ownership is resolved on the new system, in case the UID numeric values differ between systems. This is bad for an LXC filesystem because the numeric uid/gid ownership is intended to be preserved for the whole filesystem. If it gets resolved to a different value, bad things happen.
- If you're using an overlay backed container, you'll also need to migrate the container this new one is based off of.
- Lastly, you might see a few warnings about skipped socket files: `//tar: /var/lib/lxc/$NAME/rootfs/dev/log: socket ignored//` I've ignored this error, and haven't had any issues with any of the containers I manage.


## References

- Adapted from (StackOverflow): [How do I Backup / Move LXC containers?][1]


<!-- REFERENCES -->

[1]:http://stackoverflow.com/questions/23427129/how-do-i-backup-move-lxc-containers/34194341#34194341
