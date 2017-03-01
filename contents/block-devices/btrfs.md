# Btrfs

> Btrfs is a modern copy on write (CoW) filesystem for Linux aimed at implementing advanced features while also focusing on fault tolerance, repair and easy administration. Jointly developed at multiple companies, Btrfs is licensed under the GPL and open for contribution from anyone. [~btrfs Wiki][3]

Application: When lxc-snaphot functionality is bugged (as is the case for the openWRT version used on the Turris Omnia at the time of writing) Btrfs subvolume snapshots can fulfill the job instead.

## Create subvolume

Type: `btrfs <subvolume> create <path/to/target>` to create a subvolume:

```shell
$ btrfs subvolume create path/to/target
```


## Snapshot subvolume

Type: `btrfs <subvolume> snapshot <path/to/source> <path/to/target>` to snapshot a subvolume:

```shell
$ btrfs subvolume snapshot path/to/source path/to/target
```

Notes:
- Snapshots can only be made of subvolumes!
- Snapshots become individual subvolumes themselves.


## Delete subvolume

Type: `btrfs <subvolume> delete <path/to/target>` to delete a subvolume:

```
$ btrfs subvolume delete path/to/target
```


## References
- Adapted from: [BTRFS begineer tutorial (part 1)][1]
- Adapted from: [BTRFS begineer tutorial (part 2)][2]



<!-- REFERENCES -->

 [1]:https://www.linux.com/learn/how-manage-btrfs-storage-pools-subvolumes-and-snapshots-linux-part-1
 [2]: https://www.linux.com/learn/how-create-and-manage-btrfs-snapshots-and-rollbacks-linux-part-2
 [3]:https://btrfs.wiki.kernel.org/index.php/Main_Page
