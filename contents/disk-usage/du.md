Du

> du (abbreviated from disk usage) is a standard Unix program used to estimate file space usage—space used under a particular directory or files on a file system. [~Wikipedia][1]

Present disk usage:

* user@system:~$ `du -hs`
* user@system:~$ `du -hs /home/* | sort -h`

The 1st command presents the disk usage of the _current folder_ in a human-readable format (-h) that is furthermore summarized (-s).

The 2nd command does the same but for each file and directories in /home/* (i.e. all home-dirs) _separately_. It has the results additionally piped to 'sort' that creates a list sorted on human-readable size (-h) from du's output.

_Note:_ [du][2] is included in most GNU/Linux distributions by default.


<!-- REFERENCES -->

[1]:https://en.wikipedia.org/wiki/Du_(Unix)
[2]:https://linux.die.net/man/1/du
