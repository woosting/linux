# Partition clearing/wiping/erasing/repairs

Application: When an USB flashdrive (usbstick / thumbdrive / key) is to be restored to its original (empty) state after it has gone bad (beyond repair by regular tooling) and have *everything* deleted from it.


## GNU/Linux (Debian)

### Delete the old partitions that remain on the USB key:

1. Type: `su` and press **Enter** to become root on the (Bash) shell:

  ```Shell
  $ su

  ```

2. Type: `fdisk -l` and press **Enter** to find your USB drive letter (note or remember it for later use):

  ```Shell
  $ fdisk -l

  ```
3. Type: `fdisk /dev/sdx` (replacing **x** with _your_ drive letter) and press **Enter** to open the partitioning program _fdisk_ while targeting the correct partition:

  ```Shell
  $ fdisk /dev/sdx
  ```

4. Type: `d` and press **Enter** to proceed to the section to delete a partition:

  ```shell
  d
  ```

5. Type: `1` and press **Enter** to mark the first partition for deletion:

  ```shell
  1
  ```

  _Note: This partition will be removed irretrievably once all changes are written to disk!_

6. OPTIONALLY: Type `d` and press **Enter** to mark a next partition for deletion (fdisk should automatically select the next partition) and repeat this procedure according to your particular needs.

### OPTIONALLY: Create new partition(s):

1. Type: `n` and press **Enter** to make a new partition:

  ```shell
  n
  ```

2. Type: `p` and press **Enter** to make this partition primary:

  ```shell
  p
  ```

3. Type: `1` and press **Enter** to make this the first partition:

  ```shell
  1
  ```

4. Press: **Enter** to accept the default first cylinder.

  ```shell

  ```

5. Press: **Enter** again to accept the default last cylinder.

  ```shell

  ```


### Finalize the process:

1. Type: `w` and press **Enter** to write the proposed (new) partition scheme to the USB key:

  ```
  w
  ```

2. Type: `umount /dev/sdxi` (replacing **x** with _your_ partition-letter and the **i** with _your_ partition number) and press **Enter** to unmount the USB drive:

  ```
  $ umount /dev/sdxi

  ```

### OPTIONALLY: Create / format a new (fat) file system:

8. Type: `mkfs.vfat -F 32 /dev/sdx1` (replacing **x** with your USB key drive letter) to format / write a (Fat32) file system to the USB drive:

  ```
  $ mkfs.vfat -F 32 /dev/sdx1

  ```



## Microsoft Windows 7

### Delete any old remaining partitions that remain on the USB key:

1. Open a Windows command prompt as administrator (**cmd.exe**):

  1. Click: **START > Search** to navigate to the search field.

  2. Type: `cmd` in the search field and press **Enter** to open the command prompt.

2. Type: `Diskpart` and press **Enter** to open the partitioning program:

  ```shell
  > Diskpart
  ```

3. Type: `List disk` and press **Enter** to have all disks printed on screen:

  ```shell
  DISKPART> List disk
  ```

4. Type: `Select Disk x` (replacing **x** with the disk-number of _your_ USB drive)  and press **Enter** to select it:

  ```shell
  DISKPART> Select Disk X
  ```

  _Note: This USB drive will be wiped irretrievably at the next step!_

5. Type: `Clean` and press **Enter** to actually wipe the disk:

  ```shell
  DISKPART> Clean
  ```

  _Note: This can not be undone!_

### OPTIONALLY: Create new partition(s):

1. Type: `Create Partition Primary` and press **Enter** to make a primary partition:

  ```shell
  DISKPART> Create Partition Primary
  ```

2. Type: `Activate` and press **Enter** to mark the partition active:

  ```shell
  DISKPART> Activate
  ```

3. Type: `Format fs=Fat32 Quick` and press **Enter** to write (format) the file-system (Fat32) to the active partition:

  ```shell
  DISKPART> Format fs=Fat32 Quick
  ```

4. Type: `Exit` and press **Enter** to leave the partition program Diskpart:

  ```shell
  DISKPART> Exit
  ```

  ![Diskpart](assets/diskpart-procedure.png)



## Alternatives

- GUI oriented (Windows) tool: [SDFormatter][2]
- GUI oriented (Windows) tool: [BOOTICE][3]



## References

- Adapted from: [Pendrivelinux][1]


<!-- References -->
[1]:https://www.pendrivelinux.com/restoring-your-usb-key-partition/
[2]: https://www.sdcard.org/downloads/formatter_4
[3]:http://bbs.wuyou.net/forum.php?mod=viewthread&tid=57675&extra=page%3D1&page=1
