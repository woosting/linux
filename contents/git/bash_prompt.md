To embed Git branch and status indicators into the Bash prompt:

1. Install the bash-completion package:

	```
	# apt install bash-completion -y
	```

2. Open the bash configuration file for editing:

	```
	$ vim ~/.bashrc
	```

3. Append it with the following lines:

	```shell
	# Bash completion
	  if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
	  fi
	```

4. Modify the prompt to have the git information included:

	```shell
	export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\$\[\033[00m\] '
	```

	> This causes the prompt to show the username and hostname (green) and the current working directory (blue). Only when you're inside a Git repository, it will show the current branch (yellow). In case you already have a fancy pants prompt, it's a matter of incorporating the `__git_ps1` function call.

5. Activate the git status indicator, by adding the following line _before the line added in the previous step_:

	```
	export GIT_PS1_SHOWDIRTYSTATE=1
	```

	> Adding the indicator causes an additional * (asterisk character) in the prompt to show whenever there are non-committed changes around. It also shows a + (plus character) for changes which are staged but not yet committed (git add).

	> Adding the indicator is optional, but when implemented it *must* precede the PS1 line:
	> ```
	> export GIT_PS1_SHOWDIRTYSTATE=1
	> export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\$\[\033[00m\] '
	> ```

	> _Note: Having this in place causes repositories to take considerably longer to load, because it takes a while to check the repository for pending changes (usually only the first time it is accessed, as the disk cache should speed things up afterwards)._

6. Reload bash configuration:

	> ```
	> $ source ~/.bashrc
	> ```

## References

Adapted from (Bram Schoenmakers): [Show current Git branch and status in your prompt][1]

<!-- REEFERENCES -->

[1]:http://www.bramschoenmakers.nl/en/node/624
