# Install SD card reader

> From `lspci`:
>
> 03:01.1 SD Host controller [0805]: Ricoh Co Ltd R5C822 SD/SDIO/MMC/MS/MSPro Host Adapter [1180:0822] (rev 19)

## Either:

- sudo setpci -v -s 08:03.1 0xCA=0x57
- sudo setpci -v -s 08:03.1 0xCB=0x02
- sudo setpci -v -s 08:03.1 0xCA=0x00

> Adapted from: Debian User Forums [Ricoh Co Ltd R5C822 SD/SDIO/MMC/MS/MSPro Host Adapter][1]

## Or:

- Requires the `sdhci-pci` kernel module.

> Adapted from: Wiki.debian.org [InstallingDebianOn Thinkpad T500][2]

## Or both of the aforementioned).


<!-- REFERENCES -->

[1]: http://forums.debian.net/viewtopic.php?p=129463
[2]: https://wiki.debian.org/InstallingDebianOn/Thinkpad/T500
