# Partitioning & formatting

Partition and format (write a file system) a disk (block-device):


## Oldschool (fdisk)

1. Start the oldschool CLI partition tool:

	```
	$ fdisk
	```
2. Follow the interactive instructions / menu on screen.


## Ncurses (cfdisk)

1. Start the new (ncurses based) CLI partition tool:

	```
	$ cfdisk
	```

2. Follow the interactive instructions / menu on screen.


## References:

- Adapted from: [Partitioning with fdisk (TLDP how-to)][1]
- Adapted from: [Appendix: Using cfdisk to partition your harddisk (TLDP how-to)][2]


<!-- REFERENCES -->
[1]:http://tldp.org/HOWTO/Partition/fdisk_partitioning.html
[2]:http://www.tldp.org/HOWTO/IBM7248-HOWTO/cfdisk.html
