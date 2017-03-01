# Block-device listing

Application: To find out at what device (e.g. /dev/sdx) an USB flash-drive (aka: thumb-drive, USB-disk, USB-drive, USB-key, flashku) is registered as in the file-tree.

1. Type: `lsblk` and press **Enter** to print all block devices (including USB-drives) to screen.

2. Either **insert / remove** (depending on the point of departure) USB-drive.

3. Type: `lsblk` and press **Enter** again to re-print all block devices (including USB-drives) to screen.

4. Investigate the difference between the two lists to find out what device got added.

```shell
lsblk
```
