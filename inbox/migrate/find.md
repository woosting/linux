To find files on a filesystem issue: `find /home/david -name 'index*'`

> The 1st command would find files having the letters index as the beginning of the file name. The search would be started in the directory /home/david and carry on within that directory and its subdirectories only.

To find files on a file system case insencitively issue: `find /home/david -iname 'index*'`

> The 2nd command would search for the same, but the case of the filename wouldn't be considered. So all files starting with any combination of letters in upper and lower case such as INDEX or indEX or index would be returned.

# References

Adapted from: [How to find files in Linux using 'find'][1]

<!-- REEFERENCES -->
[1]:http://www.codecoffee.com/tipsforlinux/articles/21.html
