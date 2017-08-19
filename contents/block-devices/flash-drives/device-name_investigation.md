# Block-device listing

<!-- thumb-drive, USB-disk, USB-drive, USB-key, flashku -->

Find out how an USB flash-drive is registered as in the file-tree (e.g. /dev/sdx):

1. Print the complete block device tree to screen (including USB-drives):

	```
	$ lsblk
	```

2. Insert (or remove) the USB-drive.

3. Print the complete block device tree to screen again (including USB-drives):

	```
	$ lsblk
	```

4. Look for the difference between the two lists.

<!-- NGREP ONELINERS

>>> List (block / usb) device tree: $ lsblk

-->
