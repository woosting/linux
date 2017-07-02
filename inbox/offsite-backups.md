# Duplicity (offsite) backups


## Installation

1. Generate a GPG key:

    ```shell
    gpg --full-generate-key
    ```

2. Install Duplicity incuding backup modules:

    ```shell
    apt install duplicity lftp python-crypto python-paramiko python-pexpect
    ```


## Backup

1. Set [environment variables to hold credentials][1] and execute the actual backup:

    ```shell
    PASSPHRASE=<gpg passphrase> FTP_PASSWORD=<ssh passphrase> duplicity --full-if-older-than 1M --verbosity=8 --numeric-owner </path/to/source> pexpect+sftp://<USER>@<HOSTNAME>:54968/backup     
    ```
    With:

    `PASSPHRASE=<gpg passphrase>` setting a variabele containing the password of the GPG key to be used.

    `FTP_PASSWORD=<ssh passphrase>` setting a variable containing the SSH password of the server.

    `--full-if-older-than <time>` specifying the full-backup frequency (in this case once per month), other executions will be incremental.

    `--verbosity <level>` geeft aan hoeveel output hij moet generen, de default (4) is vrij magertjes en geeft je eigenlijk alleen de samenvatting nadat de backup is afgerond. met 8 worden de files weergeven die processed worden en wat de status daarvan is. Eventuee is er ook een 9 voor debugging, maar dat zal je niet snel nodig hebben.

    `--numeric-owner` slaat de UID op van de user i.p.v. naam (zie ook man tar)

    `<ssh passphrase>` vervolgens gevolgd met de source van de files die je wilt backupen

    `<ssh passphrase>` de backend (target) waar de backups naartoe geschreven moeten worden. In dit geval pexpect+sftp.

    er zijn meerdere varianten van scp/sftp, maar deze variant lijkt het beste te performen n.a.v. mijn eigen ervaring (zie eventueel ook t.b.v. SSH backends http://duplicity.nongnu.org/duplicity.1.html#sect23)


## Restore

1. Execute the restore:

    ```shell
    duplicity restore --time 1W pexpect+sftp://<USER>@<HOSTNAME>:54968/backup /target
    ```

    With:

    `--time <time>` specifying the specific backup to restore from. When omitted the most recently made backup will be used.

    optionally:
    
    `--file-to-restore </path/to/file>` specifying specific files to restore from the backup. When omitted the complete backup will be restored.


## Cleanup


### Retention

1. Perform cleanup:

    ```shell
    duplicity remove-older-than 3M --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
    ```

    With:


    `remove-older-than <time>` defining from what age old backups are to be deleted (in this case backups older than 3 months).

    `--force` stating that the files should actually be deleted (otherwise the files to be deleted would only be printed on screen).


    > ```shell
    > duplicity cleanup --force pexpect+sftp://<USER>@<HOSTNAME>:54968/backup
    > ```


 <!-- REFERENCES -->
[1]:http://duplicity.nongnu.org/duplicity.1.html#sect6

