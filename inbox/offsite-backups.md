1. Generate a GPG key:

    ```shell
    gpg --full-generate-key
    ```

2. Install Duplicity incuding backup modules:

    ```shell
    apt install duplicity lftp python-crypto python-paramiko python-pexpect
    ```

3. Use environment variales when "automating" duplicity (without manual passing passphrases):

    ```shell
    export PASSPHRASE=<gpg passphrase> export FTP_PASSWORD=<ssh passphrase>
    ```

 <!-- REFERENCES -->
[1]:http://duplicity.nongnu.org/duplicity.1.html#sect6
