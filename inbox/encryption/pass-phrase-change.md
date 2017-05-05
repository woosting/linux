# How to change pass phrase of full disk encryption

Ubuntu uses LUKS to encrypt partitions and LVMs.

LUKS supports eight key slots per partition.  The `cryptsetup luksAddKey` and `cryptsetup luksRemoveKey` can be used to add and remove keys from the slots.  `cryptsetup luksDump` can tell you which slots have keys in them.

Basically the right way to do this is you want to add a key to a new slot, test that you can successfully use the new key, and then when you are ready, delete the old key.

During the boot process, when you are asked for the key, it should tell which block device it's trying to unlock.  That's the partition you need to apply the `cryptsetup` commands to.

So use `cryptsetup` to add a key, reboot, and try the new key.  Once you can confirm that works, you can delete the old key.

I would back up your data before trying this or taking anyone else's advice, or at least wait for a couple upvotes.  It's been a while since I changed a key on a LUKS partition.  (edit: or used a Linux system with GUI...).

I would like to add that creating an image of the whole disk is not necessary just for modifying the passphrase. Simply use something like `cryptsetup luksHeaderBackup /dev/sda1 --header-backup-file /media/externalthing/somefile` to backup the file. Replace `luksHeaderBackup` by `luksHeaderRestore` to restore the old keys again. Note that the header backup should be saved to a secure place (preferably another LUKS partition on a USB stick).

# References:

- Adapted from (StackExchange/superuse): [How to change pass phrase of full disk encryption?][1]


<!-- REFERENCES -->

[1]:https://superuser.com/questions/431820/how-to-change-pass-phrase-of-full-disk-encryption/431832#431832
