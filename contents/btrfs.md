# Btrfs

## Operation
Create, snapshot and delete btrfs subvolumes:
- user@system:~$ `btrfs subvolume create path/to/target`
- user@system:~$ `btrfs subvolume snapshot path/to/source path/to/target`
- user@system:~$ `root@system:~/** ''btrfs subvolume delete path/to/target`

## Notes
-  Snapshots can only be made of subvolumes!
- Snapshots become regular subvolumes themselves.
- Appliance_: When lxc snaphot functionality is bugged (such as on openWRT as used on the Turris Omnia at the time of writing).

## References
- _Adapted from_: [BTRFS begineer tutorial (part 1)][1]
- _Adapted from_: [BTRFS begineer tutorial (part 2)][2]

<!-- REFERENCES -->

 [1]:https://www.linux.com/learn/how-manage-btrfs-storage-pools-subvolumes-and-snapshots-linux-part-1
 [2]: https://www.linux.com/learn/how-create-and-manage-btrfs-snapshots-and-rollbacks-linux-part-2
