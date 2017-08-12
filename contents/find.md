# Find

## Simple

Find files in a folder and its children (recursively) on a filesystem:

```
find </search/start/path/> -name '<search-string>'
```

> Note the `'` (single quote) characters around the search-string!

## Case insensitively

Find files ignoring the search string's case:

```
find </search/start/path/> -iname '<search-string>'
```

> Note the prefix "i" in `-iname` (other than that it is identical)!


## Filtered

Find files from a specific uid while excluding (pruning) specific directories from the search:

```
find </search/start/path/> -type d \( -path </dir1> -o -path </dir2> \) -prune -o -uid <503>
```

>	With:
	`- type d` signaling directories.
	`\( ... \)` defining a group of items.
	`-path </dirx>` pointing to the specific directory paths ('/dir1' and '/dir2').
	`-o` signaling a logical "or" relation.
	`-prune` declaring the _aforementioned_ items (dirs) have to be excluded.
	`-uid <uid>` targeting a specific user identity (503).


## Large files

Find the top 10 of large files and save the results to a file:

```
find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {} | grep -v "Permission denied" > largest_files.txt && more largest_files.txt
```

> Or use `-type d` instead of '-type f' to find directories instead of files.


## References

Adapted from: [How to find files in Linux using 'find'][1]
Adapted from: [Rainnic in the Clouds][2]

<!-- REEFERENCES -->
[1]:http://www.codecoffee.com/tipsforlinux/articles/21.html
[2]:http://rainnic.altervista.org/en/node/381
