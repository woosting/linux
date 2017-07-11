# Encrypted archive

To create an encrypted zip file with 7z archiver:
```shell
7za a -tzip -p<PASSWORD> -mem=AES256 <archive-name>.zip file1.pdf file2.txt file3.doc
```

To uncompress a zip file that is encrypted with 7za command:
```shell
7za e <archive-name>.zip
```

## REFERFENCES

Adapted from xmodulo: [How to create an encrypted zip file on Linux][1]

<!-- REFERFENCES -->

[1]:http://xmodulo.com/how-to-create-encrypted-zip-file-on-linux.html
