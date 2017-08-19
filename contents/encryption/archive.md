# Encrypted archive

## 7z archiver

### Create
```shell
$ 7za a -tzip -p<PASSWORD> -mem=AES256 <archive-name>.zip file1.pdf file2.txt file3.doc
```

### Uncompress
```shell
$ 7za e <archive-name>.zip
```

## REFERFENCES

> Adapted from: Xmodulo.com
[How to create an encrypted zip file on Linux][1]

<!-- REFERFENCES -->

[1]:http://xmodulo.com/how-to-create-encrypted-zip-file-on-linux.html


<!-- NGREP ONELINERS

>>> Create a 7zip encrypted archive:     $ 7za a -tzip -p<PASSWORD> -mem=AES256 <archive-name>.zip file1.pdf file2.txt file3.doc

>>> Uncompress a 7zip encrypted archive: $ 7za e <archive-name>.zip


-->
