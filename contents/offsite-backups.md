# Duplicity (offsite) backups

## Installation

1. 	Ensure to have a target volume accessible.

	>	This tutorial uses an SSH accessible storage volume, but other target locations are possible too.

2. Add the target host's fingerprint to the known_hosts (if not present already):

	```
	$ ssh-keyscan -t rsa -p <port> <FQDN> >> ~/.ssh/known_hosts
	```
	> Alternatively log into the ssh server to have it added:
	> ```
	> $ ssh -p <port> <user>@<host>
	> ```

1. Declare an [environment variable][1] for the _GPG key password_:

	```
	$ PASSPHRASE=<gpg passphrase>
	```

2. Declare a [environment variable][1] for the server's _SSH password_:

	```
	$ FTP_PASSWORD=<ssh passphrase>
	```

1. Generate a GPG key:

    ```
	$ gpg --full-generate-key
    ```

    > Use a strong encryption key size (e.g. 4096)

2. Install Duplicity, including the required back-end modules:

    ```
    # apt install duplicity lftp python-crypto python-pexpect
    ```


## Backup

Set environment variables to hold credentials and execute the actual backup:

```
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity --full-if-older-than 1M --log-file <path/to/logfile> --verbosity info --num-retries 3 --numeric-owner </path/to/source> pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

> With:
> `--full-if-older-than <time>` specifying the [full-backup interval (in the case above: 1M each month)][4], others will be incremental.
> `--verbosity <level>` specifying the information elaboration to be printed to screen (from little to a lot: `error`, `warning`, `notice`, `info`, or `debug`).
> `--numeric-owner` storing the original uid of the files (also see: [man tar][2]).
> `</path/to/source>` specifying the directory that must be backupped.
> `pexpect+sftp://<USER>@<HOSTNAME>:54968/backup` specifying the [storage backend][3] / target location (in this case: pexpect+sftp).

> Optionally:
> `--asynchronous-upload` speeding up the backup process.
> -- (EXPERIMENTAL) Perform file uploads asynchronously in the background, with respect to volume creation. This means that duplicity can upload a volume while, at the same time, preparing the next volume for upload. The intended end-result is a faster backup, because the local CPU and your bandwidth can be more consistently utilized. Use of this option implies additional need for disk space in the temporary storage location; rather than needing to store only one volume at a time, enough storage space is required to store two volumes.

## Restore

- Execute the restore:

	```
	PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity restore --time 1W pexpect+sftp://<USER>@<HOSTNAME>:54968/backup /target
	```

	> With: `--time <time>` specifying the specific backup to restore from. When omitted the most recently made backup will be used.

	> Optionally: `--file-to-restore </path/to/file>` defining specific files to be restored from the backup. When omitted the complete backup will be restored.


## Cleanup

### Old backups:

```
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity remove-older-than 3M --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

> With:
> `remove-older-than <time>` specifying from what age old backups are to be deleted (in this example case, 3M: backups older than 3 months).
> `--force` specifying that the files should actually be deleted (otherwise the 'files to be deleted' would only be printed on screen and not deleted).

### Incomplete backups:

```
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity cleanup --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

> With: `--force` specifying that the files should actually be deleted (otherwise the 'files to be deleted' would only be printed on screen and not deleted).


# REFERENCES

- Adapted from: [Official Duplicity documentation][5]

<!-- REFERENCES -->
[1]:http://duplicity.nongnu.org/duplicity.1.html#sect6
[2]:https://linux.die.net/man/1/tar
[3]:http://duplicity.nongnu.org/duplicity.1.html#sect7
[4]:http://duplicity.nongnu.org/duplicity.1.html#sect8
[5]:http://duplicity.nongnu.org/duplicity.1.html
