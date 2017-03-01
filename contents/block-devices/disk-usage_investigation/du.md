# du - Disk Usage

> du (abbreviated from 'disk usage') is a standard Unix program used to estimate file space usage—space used under a particular directory or files on a file system. [~Wikipedia][1]

## Simple usage

Type: `du -hs` to prints disk usage **du** in a human-readable **-h** and summarized **-s** format for the current directory:

```shell
$ du -hs
```


## Advanced usage

Type `du -hs /path/* | sort -h` to print disk usage **du** in a human-readable **-h** and summarized **-s** format for each individual item `*` in the provided path `/path/` (i.e. for all directories and files present in the directory path) and pipe `|` (push) the results to the program `sort` to have it presented in an ordered and human readable `-h` format:

```shell
$ du -hs /path/* | sort -h
```


## References

- See: [Wikipedia][1]
- See: [Linux die net][2]


<!-- REFERENCES -->

[1]:https://en.wikipedia.org/wiki/Du_(Unix)
[2]:https://linux.die.net/man/1/du
