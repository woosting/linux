# Syncthing installation via apt

## Add the release PGP keys:
`curl -s https://syncthing.net/release-key.txt | apt-key add -`

## Add the "stable" channel to your APT sources:
`echo "deb https://apt.syncthing.net/ syncthing stable" | tee /etc/apt/sources.list.d/syncthing.list`

## Update and install syncthing:
`apt-get update`
`apt-get install syncthing`
