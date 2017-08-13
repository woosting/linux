# Missing Bootmgr fix (Windows 10/8/7)

> A missing bootmgr is one of the most common boot issues in the Windows ecosystem. This can be fixed using a Win7 boot cd.
![BOOTMBR is missing](assets/01_boot-mgr-missing.png)

1. **Insert the Windows 7 Installation or Repair disk** into your drive.

2. **Reboot the System** to be prompted with: `Press any key to boot from disk`:

	![Press any key to boot from CD.](assets/02_press-any-key.png)

	> This step requires a corresponding boot preference order set in the BIOS or UEFI!

2.	**Press Enter** to be presented with the `Install Windows` dialog:

	![Language selection](assets/03_language-selection.png)

3. **Select your language** according to preference.

3. **Click [Next]** to be presented with the `Install Windows` dialog, including an option to `Repair your Computer`:

	![Repair your computer](assets/04_repair-your-computer.png)

4. **Click 'Repair your computer'** to be presented with the `System Recovery Options`:

	![System Recovery Options & OS selection](assets/05_recovery-options.png)

5.	**Check 'Use recovery tools...'** to specify you want to use the recovery _tools_ (in contrast to restoring an image).

6. **Select the operating system** at hand (i.e. Windows 7).

	> Simply ignore this step in case no operating systems are listed.

7. **Click [Next >]** to be presented with the `System recovery Options` tools:

	![System Recovery Options > Tool selection](assets/06_tool-selection.png)

8. **click 'Command Prompt'** to be presented with a dos terminal CLI:

9. **Issue the following commands** :

	```
	bootrec /fixboot
	bootrec /fixmbr
	bootrec /RebuildBCD
	```

	> Sometime you may need to change the directory from X:\Windows\System to C:\ first:
	> ```
	> X:\ c:
	> ```
	> Followed by the aforementioned commands.

10. **Reboot** to Windows!

	> In case it still does not boot into Windows run 'Startup Repair' 3 different times.

## References

- Also see: [Video tutorial][1]
- Adapted from (The Windows club): [fix-bootmgr-missing-windows-7][2]


<!-- REFERENCES -->

[1]:https://www.youtube.com/watch?v=j4KBjT-Xfgo
[2]:http://www.thewindowsclub.com/fix-bootmgr-missing-windows-7
