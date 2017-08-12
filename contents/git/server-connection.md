# Server connection

Enable Git pushes/pulls to Github:

## Open network

### Using a specific RSA-key

1. Open the ssh config file for editing:

	```
	$ vim ~/.ssh/config
	```

2. Append it with:

	```
	Host github.com
		Hostname github.com
		IdentityFile ~/.ssh/id_rsa.github
		IdentitiesOnly yes
	```

	> With: `IdentitiesOnly yes` preventing [sending the identity file matching the default filename for each protocol][3]. Otherwise, if a file named '~/.ssh/id_rsa' (the default) exists it would get used _before_ '~/.ssh/id_rsa.github'.


## Closed network (proxy)

### Openssh

Using an RSA-key with open_ssh _from behind a proxy on Windows_ (using connect.exe):

> Using a http.proxy does _not_ work for _ssh_ so ssh connection should be [proxied manually][6].


1. Open the ssh config file for editing:

	```
	vim ~/.ssh/config
	```

 2. Populate (or append) it with:

	```shell
	ProxyCommand connect -S <proxy.server.name>:<port> %h %p

	Host github.com
	  User git
	  Port 22
	  Hostname github.com
	#   IdentityFile "C:\users\username\.ssh\id_rsa"
	  TCPKeepAlive yes
	  IdentitiesOnly yes

	Host ssh.github.com
	  User git
	  Port 443
	  Hostname ssh.github.com
	#  IdentityFile "C:\users\username\.ssh\id_rsa"
	  TCPKeepAlive yes
	  IdentitiesOnly yes
	  ```

	  > with: `proxy.server.name:port` being the proxy server IP (or hostname) and port number.

	  > \+ Paths to id_rsa

	  > On Linux file systems,  `~/.ssh/config`'s file permission must be 600. On NTFS (Windows) partitions, such permissions do not exist.

	  > Most mysgit versions include [connect.exe][5]. In case yours does not than you must download/compile [connect.c][4] manually.

	  > If your proxy requires NTLM authentication, you can use [cntlm][7] (See [StackOverflow][8] for more info).

	  > If a 'socks4 proxy' is to be used then change `-S` to `-H`:
	  > ```
	  > ProxyCommand connect -H proxy.server.name:1080 %h %p
	  > ...
	  > ```


### Putty (plink)

Using an RSA-key via Putty (plink) _from behind a proxy on Windows_:

1. Install Git choosing `plink` instead of 'open ssh'.
2. Set _Putty's 'Default settings' to the proxy settings
	> plink uses the 'Default settings'.
3. Generate SSH private-public key pair (using Putty's keygen).
4. Load the created private.ppk to Pageant.
	> Pageant is Putty's RSA-key agent for Ms. Windows.
5. Convert the public key to the open_ssh format (using Putty's keygen).
6. Register the result (the public key in open_ssh format) on Github as an allowed key.


## References:

### Open connection
* Adapted from (StackOverflow): [Specify private SSH-key to use when executing shell command with or without Ruby?][1]
* Also see (StackOverflow): [Best way to use multiple SSH private keys on one client][2]
* Also see (ServerFault): [How could I stop ssh offering a wrong key?][3]


### Closed connection


#### Openssh

* Adapted from (proxy ssh tunnel): [SSH in git behind proxy on windows 7][9]


<!-- REFERENCES -->
[1]:http://stackoverflow.com/a/11251797/6737459
[2]:http://stackoverflow.com/questions/2419566/best-way-to-use-multiple-ssh-private-keys-on-one-client
[3]:https://serverfault.com/questions/450796/how-could-i-stop-ssh-offering-a-wrong-key/450807#450807

[4]:https://web.archive.org/web/20130731110457/http://www.meadowy.org/~gotoh/ssh/connect.c
[5]:https://web.archive.org/web/20130516045959/http://www.meadowy.org/~gotoh/ssh/connect.exe
[6]:http://returnbooleantrue.blogspot.com/2009/06/using-github-through-draconian-proxies.html
[7]:http://cntlm.sourceforge.net/
[8]:http://stackoverflow.com/a/15343300/33499
[9]:https://stackoverflow.com/questions/5103083/ssh-in-git-behind-proxy-on-windows-7/6739420#6739420
