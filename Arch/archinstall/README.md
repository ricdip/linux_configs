# archinstall

Usable archinstall configuration files.

## VM (VirtualBox or VMware)

```bash
user@host:~$ cd vm

user@host:~$ archinstall --config user_configuration.json --disk_layout user_disk_layout.json
```

### TODO during archinstall
1. set root password

2. add user account

3. add additional packages (optional)

4. view profile (xorg | minimal) (set to xorg, with VMware / VirtualBox open-source driver)

5. view network configuration (set to NetworkManager)

6. view disk layout:
    - /boot: fat32, 1Mib - 201Mib
    - /: btrfs, 201Mib - 100%
