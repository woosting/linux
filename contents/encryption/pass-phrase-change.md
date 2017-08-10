# Pass phrase change

> LUKS supports eight key slots per partition.  The `cryptsetup luksAddKey` and `cryptsetup luksRemoveKey` can be used to add and remove keys from the slots.  `cryptsetup luksDump` can tell you which slots have keys in them.
>
> Basically the right way to do this is you want to add a key to a new slot, test that you can successfully use the new key, and then when you are ready, delete the old key. So use `cryptsetup` to add a key, reboot, and try the new key.  Once you can confirm that works, you can delete the old key.

To change the passphrase of full disk encryption:

1. Boot from the disk and note what block device is to be unlocked.

	> It is mentioned when the password is requested.

3. Make a backup:

	```
	# cryptsetup luksHeaderBackup /dev/<sdxi> --header-backup-file </backup/path>
	```

	> Replace `luksHeaderBackup` by `luksHeaderRestore` to restore the old keys.

	> _Note: Store the header backup on a secure place (preferably another LUKS partition on a USB stick)_.

4. Add the new key:

	```
	# cryptsetup luksAddKey /dev/<sdxi>
	```

5. Reboot using the new key to unlock the disk.

6. Remove the old key, after successfully having logged-in with the new key:

	```
	# cryptsetup luksRemoveKey /dev/<sdxi>
	```

	> _Note: Only remove the old key when the new one is tested successfully!_

# References:

- Adapted from (StackExchange/superuse): [How to change pass phrase of full disk encryption?][1]


<!-- REFERENCES -->

[1]:https://superuser.com/questions/431820/how-to-change-pass-phrase-of-full-disk-encryption/431832#431832
