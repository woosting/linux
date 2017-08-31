# du (Disk Usage)

>	[Du][1] (abbreviated from 'disk usage') is a standard Unix program used to estimate file space usage—space used under a particular directory or files on a file system.

## Simple usage

Print disk usage for the current directory (pwd):

```
$ du -hs
```

>	`-h` - human readable.
>	`-s` - summarize.


## Advanced usage

Print a sorted disk usage overview of all individual items (folders and files)  in a specific directory:

```
$ du -hs </path/>* | sort -h
```

> `-h` - human-readable.
> `-s` - summarized.
> `/path/` - directory to look in.
> `*` - take all individual items into account.
> `|` - pipe (pushing) the results to another program.
> `sort` - orders the input alphabetically.


## References

> Adapted from: wikipedia
> [Du (Unix)][1]

> Adapted from: Linux die
> [Du][2]


<!-- REFERENCES -->

[1]:https://en.wikipedia.org/wiki/Du_(Unix)
[2]:https://linux.die.net/man/1/du


<!-- NGREP ONELINERS

>>> Sorted list of disk usage via du: $ du -hs </path/>* | sort -h

-->
