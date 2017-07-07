# Duplicity (offsite) backups

## Prequirements

### Accessible target volume
The examples used in this tutorial expect an SSH accessible storage volume (however other target locations are possible). Ensure the host fingerprint is present in the known_hosts should an SSH server be used as the backup target:
```shell
ssh-keyscan -t rsa -p <port> <FQDN> >> ~/.ssh/known_hosts
```
> Alternatively log into the ssh server to do this with an interactive shell: `ssh -p <port> <user>@<host>`

### Environment variables

The examples used in this tutorial use the following [environment variables][1]:

- `PASSPHRASE=<gpg passphrase>` specifying the password of the GPG key to be used.

- `FTP_PASSWORD=<ssh passphrase>` specifying the SSH password of the server.





## Installation

1. Generate a GPG key:

    ```shell
    gpg --full-generate-key
    ```

    > Proposition: Use a strong encryption key size (e.g. 4096)

2. Install Duplicity, including the required back-end modules:

    ```shell
    apt install duplicity lftp python-crypto python-pexpect
    ```


## Backup

Set environment variables to hold credentials and execute the actual backup:

```shell
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity --full-if-older-than 1M --log-file <path/to/logfile> --verbosity info --num-retries 3 --numeric-owner </path/to/source> pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

`--full-if-older-than <time>` specifying the [full-backup interval (in this case each month)][4], all others will be incremental.

`--verbosity <level>` specifying the amount of information to be printed to screen during execution (being either: `error`, `warning`, `notice`, `info`, or `debug`).

`--numeric-owner` to store the original uid of the files (also see: [man tar][2]).

`</path/to/source>` specifying the location that is to be backupped.

`pexpect+sftp://<USER>@<HOSTNAME>:54968/backup` specifying the [storage backend][3] / target location (in this case: pexpect+sftp).

> Optionally speed up the backup process by: `--asynchronous-upload`
> (EXPERIMENTAL) Perform file uploads asynchronously in the background, with respect to volume creation. This means that duplicity can upload a volume while, at the same time, preparing the next volume for upload. The intended end-result is a faster backup, because the local CPU and your bandwidth can be more consistently utilized. Use of this option implies additional need for disk space in the temporary storage location; rather than needing to store only one volume at a time, enough storage space is required to store two volumes.

## Restore

Execute the restore:

```shell
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity restore --time 1W pexpect+sftp://<USER>@<HOSTNAME>:54968/backup /target
```

`--time <time>` specifying the specific backup to restore from. When omitted the most recently made backup will be used.

> Optionally define specific files to be restored from the backup: `--file-to-restore </path/to/file>`. When omitted the complete backup will be restored.


## Cleanup


### Retained backups

Cleanup old backups:

```shell
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity remove-older-than 3M --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

`remove-older-than <time>` specifying from what age old backups are to be deleted (in this example case: backups older than 3 months).

`--force` specifying that the files should actually be deleted (otherwise the 'files to be deleted' would only be printed on screen and not deleted).


### Incomplete backups

Cleanup incomplete backups:

```shell
PASSPHRASE='<gpg passphrase>' FTP_PASSWORD='<ssh passphrase>' duplicity cleanup --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
```

`--force` specifying that the files should actually be deleted (otherwise the 'files to be deleted' would only be printed on screen and not deleted).


# REFERENCES

- Adapted from: [Official Duplicity documentation][5]

<!-- REFERENCES -->
[1]:http://duplicity.nongnu.org/duplicity.1.html#sect6
[2]:https://linux.die.net/man/1/tar
[3]:http://duplicity.nongnu.org/duplicity.1.html#sect7
[4]:http://duplicity.nongnu.org/duplicity.1.html#sect8
[5]:http://duplicity.nongnu.org/duplicity.1.html
