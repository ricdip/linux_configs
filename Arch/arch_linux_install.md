# Arch Linux install (host Windows dual boot ver.)

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
	timedatectl set-local-rtc true
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
	mkpart
		swap
		linux-swap
		<start>GB
		<end>GB
	
	mkpart
		rootfs
		ext4
		<start>GB
		100%

###### (after closing parted)
	mkfs.ext4 /dev/sdaX
	mkswap /dev/sdaY


##### MOUNT FILESYSTEMS
	mount /dev/sdaX /mnt
	mkdir -p /mnt/boot/efi
	mount /dev/sda1 /mnt/boot/efi
	swapon /dev/sdaY



## INSTALL SYSTEM (2):
#### INSTALL ESSENTIAL PACKAGES
	pacstrap /mnt base base-devel linux linux-firmware


#### FSTAB
	genfstab -U /mnt >> /mnt/etc/fstab


#### CHROOT
	arch-chroot /mnt /bin/bash



## INSTALL SYSTEM (2.5):
#### SET TIME ZONE
	ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
	hwclock --systohc --utc
	timedatectl set-local-rtc true
	timedatectl set-ntp true


#### SET LOCALIZATION
###### (uncomment it&#95;utf-8 and it&#95;iso [for italian language] in locale.gen file)
	vim /etc/locale.gen
	locale-gen
	echo "LANG=it_IT.UTF-8" >> /etc/locale.conf
	echo "KEYMAP=it" >> /etc/vconsole.conf
	localectl set-x11-keymap it


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
	pacman -S grub efibootmgr os-prober
	grub-install --target=x86_64-efi --efi-directory=/boot/efi --recheck /dev/sda

###### (inside /etc/default/grub)
- enable recovery generation
- enable os-prober

###### (outside /etc/default/grub)
	grub-mkconfig -o /boot/grub/grub.cfg


#### SET ROOT PASSWORD
	passwd


#### INSTALL USEFUL PROGRAMS
	pacman -S networkmanager network-manager-applet openssh vim git
	systemctl enable NetworkManager.service
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


#### XORG INSTALLATION [MINIMAL]
	pacman -S xorg xorg-xinit xorg-fonts xterm
	startx


#### USER CREATION
	useradd -m -g wheel -s /bin/bash riccardo
	passwd riccardo
	visudo

###### (inside visudo, uncomment wheel and save)


#### OTHER USEFUL PROGRAMS
	pacman -S archey3 wget parted gparted dosfstools zsh htop stow fd fzf mpv npm redshift

###### (for gparted)
	pacman -S jfsutils f2fs-tools btrfs-progs exfatprogs reiserfsprogs udftools xfsprogs nilfs-utils gpart ntfs-3g


#### DISABLE BEEP IN CONSOLE TAB [OPTIONAL]
	vim /etc/inputrc

###### (inside vim, uncomment set bell-style none)


#### DISABLE BEEP GLOBALLY (PCSPEAKER MODULE) [OPTIONAL]
1. (disable until reboot)

		rmmod pcspkr
2. (prevent loading it at boot)

		echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf


#### ZSH (CONFIG WITH OH-MY-ZSH)
	pacman -S zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

###### (install useful custom plugins)
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions


#### NVIM (PLUGGED AD PLUGIN MANAGER)
	pacman -S neovim
	mkdir -p $HOME/.config/nvim/autoload
	mkdir -p $HOME/.config/nvim/plugged
	cd $HOME/.config/nvim/autoload
	wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#### DESKTOP ENVIRONMENT INSTALLATION [xfce]
	pacman -S xfce4 xfce4-goodies


#### SOUND
	pacman -S alsa-utils
	pacman -S pulseaudio pulseaudio-alsa


#### WINDOW MANAGER INSTALLATION [i3]
	pacman -S i3 i3-gaps


#### WM (i3) ADDON PROGRAMS
	pacman -S dmenu numlockx gvim xclip xorg-xfd rxvt-unicode


#### DISPLAY MANAGER INSTALLATION [lightdm]
	pacman -S lightdm lightdm-gtk-greeter
	systemctl enable lightdm

###### (inside file /etc/lightdm/lightdm.conf)
- add lightdm-gtk-greeter to greeter-session


#### DISPLAY MANAGER INSTALLATION [gdm]
	pacman -S gdm
	systemctl enable gdm


#### FONTS
	pacman -S terminus-font ttf-ubuntu-font-family ttf-roboto ttf-freefont ttf-inconsolata ttf-font-awesome ttf-dejavu ttf-liberation ttf-droid noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji ttf-fira-sans ttf-fira-mono adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts adobe-source-code-pro-fonts

	yay -S siji
	
	git clone https://aur.archlinux.org/ttf-material-design-icons-git.git
	cd ttf-material-icons-git
	makepkg -si


#### SUBLIME-TEXT
Installed plugins:

- Alignment
- BracketHighlighter
- Emmet
- Emmet Css Snippets
- GitGutter
- Package Control
- Predawn
- SideBarEnhacements
- Themr
- Color Highlighter
- ColorPicker

Theme:
- Predawn


#### RKHUNTER
	pacman -S rkhunter
	sudo rkhunter --versioncheck
	sudo rkhunter --update
	sudo rkhunter --propupd
	sudo rkhunter --check


#### ENABLE HIBERNATION
- make sure to have a swap partition with size 1.5 x RAM size
- file /etc/mkinitcpio.conf:
	- add "resume" hook to HOOKS: HOOKS=(base udev autodetect modconf block filesystems keyboard resume fsck)

- sudo mkinitcpio -P
- file /etc/default/grub:
	- run `sudo blkid /dev/sdaY -s UUID` to get swap partition UUID
	- add swap partition UUID to resume kernel parameter: `GRUB_CMDLINE_LINUX_DEFAULT="resume=UUID=<swap_partition_uuid>"`

- sudo grub-mkconfig -o /boot/grub/grub.cfg
- reboot computer


#### DISABLE BLUETOOTH
	rfkill list
	rkkill block <bluetooth_device>
