# Automation

Balance rsa-key convenience in a trade-off with security. The most appropriate way-of-working depends on the usage scenario and desired level of security:

## Passphrase, no 'ssh-agent'

_Strong security / bad usability:_
The password must be entered manually every time the key is used for authentication.

> While this is the best option from a security standpoint, it offers the worst usability. This may also lead to a weak passphrase being chosen in order to lessen the burden of entering it repeatedly.

## Passphrase, with 'ssh-agent'

_Good security / weak usability:_
The password must be entered upon every login (stays active for the session).


1. Open the bash profile file for editing:

	```
	vim ~/.bash_profile
	```

2. Add the script to load the ssh-key(s) on login:

	```shell
	if [ -z "$SSH_AUTH_SOCK" ] ; then
	  eval `ssh-agent -s`
	  ssh-add
	fi
	```

> While slightly better from a _usability_ perspective, a usability drawback is that the ssh-agent prompts for the passphrase regardless whether the key is to be used or not during session.
>
> On desktops, ssh-agents included with the desktop environment, such as the [Gnome Keyring SSH Agent][1], can be a better approach as they typically can be made to prompt for the passphrase the first time the ssh-key is used during a login session and store the decrypted private key in memory until the end of the session.

## Passphrase, with 'Keychain'
_Fair security / fair usability:_
Password must be be entered only during the first login after a reboot. On subsequent logins, the unencrypted key from the existing ssh-agent instance is used.

1. Install [Keychain][2]:

	```
	# apt install keychain
	```

2. Open the bash profile file for editing:

	```
	$ vim ~/.bash_profile
	```

3. Add the following line to it:

	```
	eval `keychain --eval id_rsa`
	```

> [Keychain][2] is a small utility which manages 'ssh-agent' on your behalf and allows the 'ssh-agent' to remain running when the login session ends. On subsequent logins, 'keychain' will connect to the existing 'ssh-agent' instance.
>
> This can be useful for allowing passwordless RSA/DSA authentication in 'cron' jobs without passwordless ssh-keys.


> From a security point of view, this approach is worse than session specific 'ssh-agent' instances, but it offers a high level of convenience. To improve the security of 'keychain', some people add the `--clear` option to their `~/.bash_profile` keychain invocation. By doing this passphrases must be re-entered on login as above, but 'cron' jobs will still have access to the unencrypted keys after the user logs out. The 'keychain' [README][3] has more information and examples.


## Passphrase, with 'ssh-agent', passphrase passed to 'ssh-add' by expect

_Weak security / good usability:_
Password is automatically entered when requested by the ssh-agent.

-----

**THIS SECTION NEEDS EXTENDING**
It lacks an actual procedure!

-----

```shell
#!/usr/bin/expect -f
spawn ssh-add /home/user/.ssh/id_rsa
expect "Enter passphrase for /home/user/.ssh/id_rsa:"
send "passphrase\n";
interact
```

> While it might seem like a straightforward idea to pass the passphrase to `ssh-add` from a script, e.g. `echo "passphrase\n" | ssh-add`, this is not as straighforward as it seems as `ssh-add` [does not read the passphrase from `stdin`, but opens `/dev/tty` directly for reading][4]. This is what is [worked around][5] by [expect][6], a tool for automating interactive applications. Below is an example of a script which adds a ssh-key using a passphrase stored in the script:


> NOTE: Passphrase is stored in plaintext in the script, from a security perspective, this is hardly better than having a passwordless ssh-key. If this approach is to be used, it is important to make sure that the expect script containing the passphrase has proper permissions set to it, making it readable, writable and runnable _only by the key owner_.

## ssh-key without passphrase

_Bad security / strong usability:_
Password entry is not required, ever.. (there simply is no password)!

> From a security standpoint, this is the worst option since the private key is entirely unprotected in case it is exposed. This is, however, the simplest method to ensure that a passphrase need not be re-entered (after a reboot).

## References

> Adapted from: Unix & Linux - StackExchange:
> [How can i run ssh add automatically without password prompt][7]


[1]:https://wiki.gnome.org/Projects/GnomeKeyring/Ssh
[2]:http://github.com/funtoo/keychain
[3]:www.funtoo.org/Keychain
[4]:http://superuser.com/questions/569432/why-can-i-see-password-prompts-through-redirecting-output
[5]:http://stackoverflow.com/questions/459182/using-expect-to-pass-a-password-to-ssh
[6]:http://expect.sourceforge.net/
[7]:https://unix.stackexchange.com/questions/90853/how-can-i-run-ssh-add-automatically-without-password-prompt/90869#90869
