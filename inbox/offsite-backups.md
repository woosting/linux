1. Generate a GPG key:

    ```shell
    gpg --full-generate-key
    ```

2. Install Duplicity incuding backup modules:

    ```shell
    apt install duplicity lftp python-crypto python-paramiko python-pexpect
    ```

3. Set credential variables and execute the actual backup:

    ```shell
    PASSPHRASE=<gpg passphrase> FTP_PASSWORD=<ssh passphrase> duplicity --full-if-older-than 1M --verbosity=8 --numeric-owner </path/to/source> pexpect+sftp://<USER>@<HOSTNAME>:54968/backup     
    ```

In essentie is de command duplicity <source> <target>

`PASSPHRASE=<gpg passphrase>` sets a variabele containing the password of the GPG key to be used.

`FTP_PASSWORD=<ssh passphrase>` sets a variable containing the SSH password of the server.

`--full-if-older-than <time>` Hiermee specificeer je hoevaak hij een full backup moet maken, in het bovenstaande voorbeeld maakt hij 1x per maand een full backup (en anders is het een incremental)

`--verbosity <level>` geeft aan hoeveel output hij moet generen, de default (4) is vrij magertjes en geeft je eigenlijk alleen de samenvatting nadat de backup is afgerond. met 8 worden de files weergeven die processed worden en wat de status daarvan is. Eventuee is er ook een 9 voor debugging, maar dat zal je niet snel nodig hebben.

`--numeric-owner` slaat de UID op van de user i.p.v. naam (zie ook man tar)

`<ssh passphrase>` vervolgens gevolgd met de source van de files die je wilt backupen

`<ssh passphrase>` de backend (target) waar de backups naartoe geschreven moeten worden. In dit geval pexpect+sftp.

er zijn meerdere varianten van scp/sftp, maar deze variant lijkt het beste te performen n.a.v. mijn eigen ervaring (zie eventueel ook t.b.v. SSH backends http://duplicity.nongnu.org/duplicity.1.html#sect23)



 <!-- REFERENCES -->
[1]:http://duplicity.nongnu.org/duplicity.1.html#sect6
