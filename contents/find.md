# Find

## Simple

Find files (recursively):

```
$ find </search/start/path/> -name '<search-string>'
```

> NOTE: The search-string is surrounded by `'` (single quote) characters!


## Case-insensitively

Find files ignoring the search string's case:

```
$ find </search/start/path/> -iname '<search-string>'
```

> NOTE: It is the "i" prefix in `-iname` thet makes the command  to be case-Insensitively executed.


## Filtered

Find files from a specific uid while excluding (pruning) specific directories from the search:

```
$ find </search/start/path/> -type d \( -path </dir1> -o -path </dir2> \) -prune -o -uid <503>
```

>	`-type d` - specifying it regards directories (d).
	`\( ... \)` - grouping items.
	`-path </dirx>` - specifying paths to dirs ('/dir1' and '/dir2').
	`-o` - specifying a logical "or" relation.
	`-prune` - declaring the _aforementioned_ items are to be excluded.
	`-uid <uid>` - targeting a specific user identity (503).


## Large files

Find the top 10 of large files and save the results to a file:

```
$ find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {} | grep -v "Permission denied" > largest_files.txt && more largest_files.txt
```

> ALSO: Use `-type d` instead of '-type f' to find _directories_ instead of files.

>  ALTERNATIVE:
>	-	NCurses Disk Usage - Ncdu is a disk usage analyzer with an ncurses interface. It is designed to find space hogs on a remote server where you don't have an entire graphical setup available, but it is a useful tool even on regular desktop systems. Ncdu aims to be fast, simple and easy to use, and should be able to run in any minimal POSIX-like environment with ncurses installed.
>	-	gt5 - Quite similar to ncdu, but a different approach.
>	-	tdu - Another small ncurses-based disk usage visualization utility.
>	-	TreeSize - GTK, using a treeview.
>	-	Baobab - GTK, using pie-charts, a treeview and a treemap. Comes with GNOME.
>	-	GdMap - GTK, with a treemap display.
>	-	KDirStat - KDE, with a treemap display.
>	-	QDiskUsage - Qt, using pie-charts.
>	-	xdiskusage - FLTK, with a treemap display.
>	-	fsv - 3D visualization.
>	-	Philesight - Web-based clone of Filelight.
>
>	>	NOTE: Many haven't received an update for a big while!

# References

> Adapted from: Code coffee
> [How to find files in Linux using 'find'][1]

> Adapted from: Rainnic in the Clouds
> [Locate large files or directories on Linux with bash][2]

<!-- REEFERENCES -->
[1]:http://www.codecoffee.com/tipsforlinux/articles/21.html
[2]:http://rainnic.altervista.org/en/node/381


<!-- NGREP ONELINERS

>>> Find:                    $ find </search/start/path/> -name '<search-string>'

>>> Find (case-insensitive): $ find </search/start/path/> -iname '<search-string>'

>>> Find (filter):           $ find </search/start/path/> -type d \( -path </dir1> -o -path </dir2> \) -prune -o -uid <503>

>>> Find (top10 + file):     $ find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {} | grep -v "Permission denied" > largest_files.txt && more largest_files.txt

-->
