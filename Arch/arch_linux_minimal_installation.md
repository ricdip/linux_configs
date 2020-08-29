# Arch Linux minimal installation

1. **PREINSTALLATION**
2. **INSTALL SYSTEM**
3. **POST INSTALLATION**


## PREINSTALLATION (1):
#### SET KEYBOARD LAYOUT
	loadkeys it

#### VERIFY BOOT MODE [OPTIONAL (only for UEFI)]
	ls /sys/firmware/efi/efivars

#### CONNECT TO INTERNET
	ping www.google.it

#### UPDATE SYSTEM CLOCK
	timedatectl set-ntp true

#### SELECT MIRRORS
	vim /etc/pacman.d/mirrorlist

#### SET COOL FONT FOR THE INSTALLATION PROCEDURE [OPTIONAL]
	pacman -S terminus-font
	setfont ter-v24b

#### PARTITIONING (GPT UEFI)
##### PARTITIONING THE DISKS
	fdisk -l
	parted --align=optimal /dev/sda
###### (inside parted)
	unit mib
	mktable gpt
	mkpart primary 2 258
	mkpart primary 258 -1
	name 1 boot
	name 2 rootfs
	set 1 boot
###### (after closing parted)
	mkfs.vfat -F 32 /dev/sda1
	mkfs.ext4 /dev/sda2

##### MOUNT FILESYSTEMS
	mount /dev/sda2 /mnt
	mkdir -p /mnt/boot/efi
	mount /dev/sda1 /mnt/boot/efi


## INSTALL SYSTEM (2):
#### INSTALL ESSENTIAL PACKAGES
	pacstrap /mnt base base-devel linux
###### (linux contains the linux-firmware)

#### FSTAB
	genfstab -U /mnt >> /mnt/etc/fstab

#### CHROOT
	arch-chroot /mnt /bin/bash

#### SET TIME ZONE
	ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
	hwclock --systohc --utc

#### SET LOCALIZATION
###### (uncomment it&#95;utf-8 and it&#95;iso [for italian language] in locale.gen file)
	vim /etc/locale.gen
	locale-gen
	echo "LANG=it_IT.UTF-8" >> /etc/locale.conf
	echo "KEYMAP=it" >> /etc/vconsole.conf

#### NETWORK CONFIGURATION
	vim /etc/hosts
###### (inside vim)
	127.0.0.1  localhost
	::1  localhost

#### HOSTNAME
	echo "Arch" >> /etc/hostname

#### INTEL-UCODE
	pacman -S intel-ucode

#### INITRAMFS
	mkinitcpio -p linux

#### BOOTLOADER [GRUB (UEFI)]
	pacman -S grub efibootmgr
	grub-install --target=x86_64-efi --efi-directory=/boot/efi --recheck /dev/sda
	grub-mkconfig -o /boot/grub/grub.cfg

#### ROOT PASSWORD
	passwd

#### INSTALL USEFUL PROGRAMS
	pacman -S dhcpcd openssh vim git
	systemctl enable dhcpcd
	systemctl enable sshd

#### REBOOT
	exit
	umount -R /mnt
	systemctl reboot


## POST INSTALLATION (3):
#### GRUB CONFIGURATION
	vim /etc/default/grub
###### (inside vim, remove "loglevel=3 quite" in GRUB_CMDLINE_LINUX_DEFAULT)
	grub-mkconfig -o /boot/grub/grub.cfg

#### AUR Helper [YAY]
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay

#### XORG INTALLATION [MINIMAL]
	pacman -S xorg xorg-xinit xorg-fonts xterm
	startx

#### VMWARE DRIVERS [OPTIONAL, if OS is running inside VMware]
	pacman -Sy open-vm-tools
	pacman -Sy xf86-video-vmware
	pacman -Sy xf86-input-vmmouse
	pacman -Sy xf86-input-libinput
	pacman -Sy mesa
	systemctl enable vmtoolsd.service
	mkinitcpio -p linux

#### USER CREATION
	useradd -m -g wheel -s /bin/bash riccardo
	passwd riccardo
	visudo
###### (inside visudo, uncomment wheel and save)

#### OTHER USEFUL PROGRAMS
	pacman -S archey3 wget parted dosfstools zsh tmux ranger htop stow


#### DISABLE BEEP IN CONSOLE TAB [OPTIONAL]
	vim /etc/inputrc
###### (inside vim, uncomment set bell-style none)

#### DISABLE BEEP GLOBALLY (PCSPEAKER MODULE) [OPTIONAL]
1. (disable until reboot)

		rmmod pcspkr
2. (prevent loading it at boot)

		echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

#### ZSH CONFIG WITH OH-MY-ZSH
	zsh
###### (inside zsh first boot wizard, choose option 0)
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#### WINDOW MANAGER INSTALLATION [i3]
	pacman -S i3 i3-gaps

#### DISPLAY MANAGER INSTALLATION [lightdm]
	pacman -S lightdm lightdm-gtk-greeter
	systemctl enable lightdm

#### DISPLAY MANAGER INSTALLATION [gdm]
	pacman -S gdm
	systemctl enable gdm

#### FONTS
	pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont ttf-liberation ttf-droid ttf-inconsolata ttf-roboto terminus-font ttf-font-awesome

#### WM ADDON PROGRAMS
	pacman -S dmenu numlockx alsa-utils gvim

#### SET X11-KEYMAP
	localectl set-x11-keymap it

#### INSTALL NETWORKMANAGER
	pacman -S networkmanager
	systemctl disable dhcpdc.service
	systemctl enable NetworkManager.service
	systemctl start NetworkManager.service

#### INSTALL NETWORKMANAGER APPLET [OPTIONAL]
	pacman -S network-manager-applet
