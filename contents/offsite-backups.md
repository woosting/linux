# Duplicity (offsite) backups

## Installation

1. 	Ensure to have a target volume accessible.

	>	NOTE: This tutorial uses an SSH accessible storage volume, but other target locations are possible too.

2. Add the target host's fingerprint to the known_hosts (if not present already):

	```
	$ ssh-keyscan -t rsa -p <port> <FQDN> >> ~/.ssh/known_hosts
	```
	> ALTERNATIVE: Log into the ssh server to have it added:
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

    > ADVICE: Use a strong encryption key size (e.g. 4096)

2. Install Duplicity, including the required back-end modules:

    ```
    # apt install duplicity lftp python-crypto python-pexpect
    ```


## Backup

Set environment variables to hold credentials and execute the actual backup:

```
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity --full-if-older-than 1M --log-file <path/to/logfile> --verbosity info --num-retries 3 --numeric-owner </path/to/source> pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

> `--full-if-older-than <time>` - [full-backup interval][4] (1M), others will be incremental.
> `--verbosity <level>` log elaboration level (`error`, `warning`, `notice`, `info`, or `debug`).
> `--numeric-owner` - storing the original uid of the files (see: [man tar][2]).
> `</path/to/source>` - directory to backup.
> `pexpect+sftp://<USER>@<HOSTNAME>:54968/backup` - [storage backend][3] / target location.

> `--asynchronous-upload` speeding up the backup process (EXPERIMENTAL). Perform file uploads asynchronously in the background, with respect to volume creation. This means that duplicity can upload a volume while, at the same time, preparing the next volume for upload. The intended end-result is a faster backup, because the local CPU and your bandwidth can be more consistently utilized. Use of this option implies additional need for disk space in the temporary storage location; rather than needing to store only one volume at a time, enough storage space is required to store two volumes.

## Restore

Restore from a previously made backup:

```
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity restore --time 1W pexpect+sftp://<USER>@<HOSTNAME>:54968/backup /target
```

> `--time <time>` - backup to restore from (default: most recent backup).

> ADDITIONAL OPTION:
> `--file-to-restore </path/to/file>` - specific file to be restored from the backup (default: all files).


## Cleanup

### Old backups:

```
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity remove-older-than 3M --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

> `remove-older-than <time>` - retention time (3M: three months).
> `--force` - actually delete (default: print to screen only).

### Incomplete backups:

```
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity cleanup --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

> `--force` - actually delete (default: print to screen only).


## References

> Adapted from: Nongnu
> [Official Duplicity documentation][5]

<!-- REFERENCES -->
[1]:http://duplicity.nongnu.org/duplicity.1.html#sect6
[2]:https://linux.die.net/man/1/tar
[3]:http://duplicity.nongnu.org/duplicity.1.html#sect7
[4]:http://duplicity.nongnu.org/duplicity.1.html#sect8
[5]:http://duplicity.nongnu.org/duplicity.1.html


<!-- NGREP ONELINERS

>>> Duplicity (backup): $ PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity restore --time 1W pexpect+sftp://<USER>@<HOSTNAME>:54968/backup /target

>>> Duplicity (restore): $ PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity restore --time 1W pexpect+sftp://<USER>@<HOSTNAME>:54968/backup /target

>>> Duplicity (clean-up): PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity cleanup --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup

-->
