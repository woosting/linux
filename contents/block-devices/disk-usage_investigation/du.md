# du - Disk Usage

>	[Du][1] (abbreviated from 'disk usage') is a standard Unix program used to estimate file space usage—space used under a particular directory or files on a file system.

## Simple usage

Print disk usage for the current directory (pwd):

```
$ du -hs
```

>	`-h`: Human readable.
>	`-s`: Summary.


## Advanced usage

Print a sorted disk usage overview of all individual items (folders and files)  in a specific directory:

```
$ du -hs </path/>* | sort -h
```

> `-h`: Human-readable.
> `-s`: Summarized.
> `/path/`: directory to look in.
> `*`: all items.
> `|`: pipe (push) the results to another program.
> `sort`: alphabetical ordering.


## References

- See: [Wikipedia][1]
- See: [Linux die net][2]


<!-- REFERENCES -->

[1]:https://en.wikipedia.org/wiki/Du_(Unix)
[2]:https://linux.die.net/man/1/du
