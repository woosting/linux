# Shrink LVM Volumes

First, as is always the case when you’re modifying disk volumes, partitions, or file systems, you should really have a recent backup. A typo in one the following commands could easily destroy data. You have been warned!

All of the required steps must be performed on an unmounted volume. If want to reduce the size of a non-root volume, simply unmount it. For a root volume, you’ll have to boot from a CD. Any modern live or rescue CD should work fine. I prefer [SystemRescueCD][1]. It includes almost any disk management programs you might need.

1. Boot from a **live CD** or USB thumbdrive.

2. Issue: `vgchange -a y` to makes any logical volumes available to the Linux. Most boot CD’s will do it automatically some time during the boot process, but repeating the command won’t hurt:

  ```shell
  $ vgchange -a y
  ```

2. Issue: `e2fsck -f /dev/<volume-group>/<logical-volume>` to force a file system check on the volume in question. Device names for LVM volumes follow the convention: '/dev/volume-group/logical-volume'. In this case, my volume group is named polar and the volume I’m going to shrink is named root:

  ```shell
  $ e2fsck -f /dev/polar/root
  ```

  _Note: This is a critical step; resizing a file system in an inconsistent state could have disastrous consequences!_

3. Issue: `resize2fs /dev/<volume-group>/<logical-volume> <90%-of-desired-size>G` to resize the _file system_. Use about 90% of the size you want the final volume to be. For example, in this case, I want the final volume to be _200_ gigabytes, so I’ll reduce the file system to _180_ gigabytes. Why is this necessary? When we reduce the size of the actual volume in the next step, it’s critical that the new size is greater than or equal to the size of the file system. After reading the documentation for both _resizefs_ and _lvreduce_, I still haven’t been able to find out whether they’re using standard computer gigabytes (1024^3 bytes) or drive manufacturer gigabytes (1000^3 bytes). In this case, the difference is very important. To be on the safe side, we’ll just shrink the file system a bit more than necessary and expand it to use the full space available later:

    ```shell
    $ resize2fs /dev/polar/root 180G
    ```

4. Issue: `lvreduce -L <desired-size>G /dev/<volume-group>/<logical-volume>` to reduce the size of the _logical volume_. In this case, use the actual size you want to the volume to be:

  ```shell
  $ lvreduce -L 200G /dev/polar/root
  ```

5. Issue: `resize2fs /dev/<volume-group>/<logical-volume>` to grow the file system so that it uses all available space on the logical volume:

  ```shell
  $ resize2fs /dev/polar/root
  ```

That’s it. Enjoy your newly acquired free space.

## References

- Adapted from: [How to Shrink an LVM Volume Safely (Random Bits)][2]

<!-- REFERENCES -->

[1]:https://www.system-rescue-cd.org/SystemRescueCd_Homepage
[2]:https://blog.shadypixel.com/how-to-shrink-an-lvm-volume-safely/
