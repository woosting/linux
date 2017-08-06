# Btrfs

> [Btrfs][3] is a modern copy on write (CoW) filesystem for Linux aimed at implementing advanced features while also focusing on fault tolerance, repair and easy administration. Jointly developed at multiple companies, Btrfs is licensed under the GPL and open for contribution from anyone.

Replace lxc-snaphot functionality should it be bugged (as is the case for the openWRT version used on the [Turris Omnia][4] at the time of writing).

## Create subvolumes

Create a subvolume:
```
$ btrfs subvolume create <path/to/target>
```


## Snapshot subvolumes
Snapshot a subvolume:
```
$ btrfs subvolume snapshot <path/to/source> <path/to/target>
```

> Snapshots can only be made of subvolumes (so originals have to be created as such)!

> Snapshots become individual subvolumes themselves.


## Delete subvolumes
Delete a subvolume:
```
$ btrfs subvolume delete <path/to/target>
```


## References
- Adapted from: [BTRFS begineer tutorial (part 1)][1]
- Adapted from: [BTRFS begineer tutorial (part 2)][2]



<!-- REFERENCES -->

[1]:https://www.linux.com/learn/how-manage-btrfs-storage-pools-subvolumes-and-snapshots-linux-part-1
[2]: https://www.linux.com/learn/how-create-and-manage-btrfs-snapshots-and-rollbacks-linux-part-2
[3]:https://btrfs.wiki.kernel.org/index.php/Main_Page
[4]:https://omnia.turris.cz/en/
