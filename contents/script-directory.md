# Script directory

## Without link resolving

Find out the full directory name of a _bash_ script (in contrast to where it is running from) from within the script no matter where it is being called from:

```bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
```

> NOTE: Only works for '_#!/bin/bash_' scripts!

> NOTE: Does _not_ work when the last component of the path used to find the script is a symlink (directory links are fine)!


## With link resolving

Find out the full directory name of the script (in contrast to where it is running from) from within the script no matter where it is being called from _resolving any links to the script itself_:

```bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
```

> NOTE: Only works for '_#!/bin/bash_' scripts!

> NOTE: Works with any combination of aliases, `source`, `bash -c`, symlinks, etc.

> NOTE: If you `cd` to a different directory before running this snippet, the result may be incorrect! Also, watch out for [`$CDPATH` gotchas][2].

> EXTRA: To understand how it works, try running this more verbose form:
>
> ```BASH
> #!/bin/bash
>
>SOURCE="${BASH_SOURCE[0]}"
>while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a >symlink
>  TARGET="$(readlink "$SOURCE")"
>  if [[ $TARGET == /* ]]; then
>	echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
>	SOURCE="$TARGET"
>  else
>	DIR="$( dirname "$SOURCE" )"
>	echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
>	SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
>  fi
>done
>echo "SOURCE is '$SOURCE'"
>RDIR="$( dirname "$SOURCE" )"
>DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
>if [ "$DIR" != "$RDIR" ]; then
>  echo "DIR '$RDIR' resolves to '$DIR'"
>fi
>echo "DIR is '$DIR'"
> ```
> It will print something like:
>
><!-- language: none -->
>
> ```
> SOURCE './scriptdir.sh' is a relative symlink to 'sym2/scriptdir.sh' (relative to '.')
> SOURCE is './sym2/scriptdir.sh'
> DIR './sym2' resolves to '/home/ubuntu/dotfiles/fo fo/real/real1/real2'
> DIR is '/home/ubuntu/dotfiles/fo fo/real/real1/real2'
> ```

# References

> Adapted from: Stack Overflow
> [Getting the source directory of a Bash script from within][1]

<!-- REFERENCES -->

[1]:https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within/246128#246128
[2]:http://bosker.wordpress.com/2012/02/12/bash-scripters-beware-of-the-cdpath/
