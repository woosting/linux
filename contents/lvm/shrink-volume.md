# Shrink LVM Volumes

0. Create a backup of the volume's data!

1. Unmount the volume:

	```
	# umount </path/to/mount-point>
	```

	> With: `/path/to/mount-point`: specifying the path to the moint-point of the volume.

	> Boot from a [live CD][1] / USB-drive if necessary (e.g. for root volumes).

2. Make any logical volumes available to Linux:

	```
	$ vgchange -a y
	```

	> Most boot CD’s will do this automatically at boot, but repeating the command won’t hurt.

2. Check the file system of the volume:

	```
	$ e2fsck -f /dev/<volume-group>/<logical-volume>
	```

	>_Note: Resizing a file system in an inconsistent state could have disastrous consequences!_

3. Resize the _file system_:

	```
	$ resize2fs /dev/<volume-group>/<logical-volume> <90%-of-desired-size>G
	```

	> Use about 90% of the size you want the final volume to be. For example, you want the final volume to be _200_ gigabytes, reduce the file system to _180_ gigabytes!
	>
	> > This is important because it is critical that the volume's new size is greater than or equal to the size of the file system, when we reduce the size of the actual volume in the next step!
	> >
	> > It is unclear whether standard computer gigabytes (1024^3 bytes) or drive manufacturer gigabytes (1000^3 bytes) are used, which is why we shrink the file system a bit more than necessary (to be on the safe side) and expand it to use the full space available later.

4. Reduce the size of the _logical volume_:

	```
	$ lvreduce -L <desired-size>G /dev/<volume-group>/<logical-volume>
	```

	> In this case, use the actual desired size (as this regards the Volume).

5. Grow the _file system_ to fill all available space on the _logical volume_:

	```
	$ resize2fs /dev/<volume-group>/<logical-volume>
	```

## References

- Adapted from: [How to Shrink an LVM Volume Safely (Random Bits)][2]

<!-- REFERENCES -->

[1]:https://www.system-rescue-cd.org/SystemRescueCd_Homepage
[2]:https://blog.shadypixel.com/how-to-shrink-an-lvm-volume-safely/
