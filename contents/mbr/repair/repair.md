# Repair Master Boot Record (MBR) -- Windows 10 / 8 / 7

> Common reasons why MBRs get corrupted are: malware infections, improper shutdowns, Linux Grub being installed and Windows is not able to detect it. On some occasions, you may get the Bootmgr is missing error. In such cases you can run the rebuild or repair MBR to fix these issues.

The process is almost same for Windows 10 / 8 / 7. First and foremost you need a Windows 8 or Windows 7 installation DVD.

1. **Boot the system while pressing [F8]** to go into the 'Windows Recovery Menu':

	> Unlike other version Windows 8’s recovery menu has the Metro UI style:

	![Windows recovery menu](assets/01_windows-recovery-menu.png)


2. **Click 'Troubleshoot'**.

3. **Click 'Advanced options'** to be presented to the `Automatic Repair` option:

	![Windows recovery menu](assets/02_advanced-options.png)

4. **Click 'Automatic repair'** to get into the Automatic Repair menu.

{{./pasted_image001.png}}

==== Step 4: ====

We need to use the **Bootrec.exe** tool. Click on command prompt and type in the following commands, one after the other:

{{./pasted_image002.png}}

* ''bootrec /RebuildBcd''
* ''bootrec /fixMbr''
* ''bootrec /fixboot''
* ''Exit''

Now go ahead and reboot your system. In some cases you may need to run some additional commands.

{{./pasted_image003.png}}

* **bootsect /nt60 SYS** or **bootsect /nt60 ALL**

It’s wise to backup MBR or [[http://www.thewindowsclub.com/create-recovery-drive-windows-8|create a System Recovery Disk]] so that in case something like this happens you don’t have to run for the Windows Recovery Disk. To create a system recovery drive in Windows 8, follow these steps:

* Press ''Win'' + R and type in **RecoveryDrive.exe**

{{./pasted_image004.png}}

* Click **Next**

* Once you insert the **USB drive** it will start creating the Recovery for you’re USB drive.

You can also check out [[https://www.youtube.com/watch?v=3xkMT8Hyhqc|this video I created for Windows 7]].

===== Referneces =====
Adapted from: http://www.thewindowsclub.com/repair-master-boot-record-mbr-windows
