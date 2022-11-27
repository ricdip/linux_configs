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

- inside parted:
	```
	mkpart
		rootfs
		ext4
		<start>GB
		<end>GB

	mkpart
		swap
		linux-swap
		<start>GB
		100%
	```

- after closing parted:
	```
	mkfs.ext4 /dev/sdaX
	mkswap /dev/sdaY
	```

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
```
vim /etc/locale.gen
```

- uncomment it&#95;utf-8 and it&#95;iso [for italian language] in locale.gen file

```
locale-gen
echo "LANG=it_IT.UTF-8" >> /etc/locale.conf
echo "KEYMAP=it" >> /etc/vconsole.conf
localectl set-x11-keymap it
```

#### NETWORK CONFIGURATION
	vim /etc/hosts

- inside vim:
	```
	127.0.0.1  localhost
	::1  localhost
	```

#### HOSTNAME
	echo "Arch" >> /etc/hostname


#### INTEL-UCODE
	pacman -S intel-ucode


#### INITRAMFS
	mkinitcpio -p linux


#### BOOTLOADER [GRUB (UEFI)]
	pacman -S grub efibootmgr os-prober
	grub-install --target=x86_64-efi --efi-directory=/boot/efi --recheck /dev/sda

- inside /etc/default/grub:
	- enable recovery generation
	- enable os-prober

- outside /etc/default/grub:
	```
	grub-mkconfig -o /boot/grub/grub.cfg
	```

#### SET ROOT PASSWORD
	passwd


#### INSTALL USEFUL PROGRAMS
	pacman -S networkmanager network-manager-applet openssh vim git
	systemctl enable NetworkManager.service


#### REBOOT
	exit
	umount -R /mnt
	systemctl reboot



## POST INSTALLATION (3):
#### GRUB CONFIGURATION
	vim /etc/default/grub

- inside vim:
	- remove "loglevel=3 quite" in GRUB_CMDLINE_LINUX_DEFAULT
	
- outside vim:
	```
	grub-mkconfig -o /boot/grub/grub.cfg
	```

#### INSTALL AUR Helper [YAY]
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	rm -rf yay

        yay -Y --gendb
        yay -Y --devel --save


#### XORG INSTALLATION [MINIMAL]
	pacman -S xorg xorg-xinit xorg-fonts xterm xorg-xhost startx xorg-xrandr arandr

#### GRAPHICS DRIVERS
	pacman -S mesa mesa-utils 

#### OPTIONAL GRAPHICS DRIVERS
	pacman -S xf86-video-intel xf86-video-nouveau vulkan-intel vulkan-mesa-layers

#### GRAPHICS ADDONS
	pacman -S glxinfo

#### GRAPHICS BENCHMARKING
	yay -S glmark2-git

- run benchmarks:
	```
	glmark2
	optirun glmark2
	
	glxgears
	optirun glxgears

	vblank_mode=0 glxgears
	vblank_mode=0 optirun glxgears

	glxspheres64
	optirun glxspheres64

	vblank_mode=0 glxspheres64
	vblank_mode=0 optirun glxspheres64
	```

#### INSTALL NVIDIA DRIVERS [OPTIONAL]
	pacman -Rs nvidia nvidia-utils
	pacman -S linux-headers
	echo "blacklist nouveau" >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf

- download correct Linux driver from https://www.nvidia.com/en-us/drivers/unix/
- chmod u+x NVIDIA-Linux-x86_64-470.xx
- reboot in recovery mode
- as root, run:
	```
	sh ./NVIDIA-Linux-x86_64-470.xx
	```
- reboot
- check installation success with `nvidia-smi` command

#### INSTALL BUMBLEBEE [OPTIONAL] (after installing DE or WM)
	pacman -S bbswitch
	pacman -S bumblebee (with opencl-mesa choice)
	usermod -aG bumblebee riccardo
	systemctl enable bumblebee.service

- reboot
- testing installation: `optirun glxgears -info`
- if error:
	```
	sudo vim /etc/bumblebee/xorg.conf.nvidia
	```
	- inside vim: uncomment `BusID PCI:01:00:0` line (PCI:01:00:0 is the location of my dedicated graphics)
	- reboot

- for intel graphics card xorg configuration (alongside Bumblebee):
	```
	cd /etc/X11/xorg.config.d
	sudo vim 20-intel.conf
	```
	- inside 20-intel.conf (PCI:0:2:0 is the location of my integrated graphics):

			Section "Device"
				Identifier "Intel Graphics"
				Driver "modesetting"
				BusID "PCI:0:2:0"
			EndSection

- install primus: `pacman -S primus`

#### GENERATE XORG CONFIG (before startx, if we will not use Bumblebee)
	X -configure

- copy xorg.conf.new file in directory /etc/X11 as xorg.conf
- inside xorg.conf file, for both devices Card0 and Card1 (graphics cards) choose Driver "modesetting"
- after startx you can see xorg log in file /var/log/Xorg.0.log
- you can test graphics card with command line program "glxgears"


#### USER CREATION
	useradd -m -g wheel -s /bin/bash riccardo
	passwd riccardo
	visudo

- inside visudo, uncomment wheel and save


#### OTHER USEFUL PROGRAMS
	pacman -S archey3 wget parted gparted zsh htop stow fd fzf mpv vlc npm redshift nvtop dunst acpi tree ripgrep ripgrep-all bat nnn

	yay -S inxi google-chrome sublime-text

- for gparted:
	```
	pacman -S jfsutils f2fs-tools btrfs-progs exfatprogs reiserfsprogs udftools xfsprogs nilfs-utils gpart ntfs-3g dosfstools
	```

#### DISABLE BEEP IN CONSOLE TAB [OPTIONAL]
	vim /etc/inputrc

- inside vim: uncomment set bell-style none


#### DISABLE BEEP GLOBALLY (PCSPEAKER MODULE) [OPTIONAL]
1. (disable until reboot)

		rmmod pcspkr
2. (prevent loading it at boot)

		echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf


#### ZSH (CONFIG WITH OH-MY-ZSH)
	pacman -S zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

- enable useful plugins:
	- add `git` to plugins list in `.zshrc`
	- add `jump` to plugins list in `.zshrc`
	- add `fd` to plugins list in `.zshrc`
	- add `fzf` to plugins list in `.zshrc`

- install useful custom plugins:
	```
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
	```

- enable custom plugins:
	- add `zsh-syntax-highlighting` to plugins list in `.zshrc`
	- add `zsh-autosuggestions` to plugins list in `.zshrc`
	- add `zsh-completions` to plugins list in `.zshrc`


#### NVIM
	pacman -S neovim

- get nvim Lua configuration by running stow (`run_stow` script)


#### DESKTOP ENVIRONMENT INSTALLATION [XFCE]
	pacman -S xfce4 xfce4-goodies


#### SOUND
	pacman -S alsa-utils
	pacman -S pulseaudio pulseaudio-alsa


#### WINDOW MANAGER INSTALLATION [i3]
	pacman -S i3 i3-gaps


#### WM ADDON PROGRAMS [i3]
	pacman -S dmenu numlockx gvim xclip xorg-xfd rxvt-unicode


#### DISPLAY MANAGER INSTALLATION [lightdm] (for XFCE, not for Gnome)
	pacman -S lightdm lightdm-gtk-greeter
	systemctl enable lightdm

- inside file /etc/lightdm/lightdm.conf:
	- add lightdm-gtk-greeter to greeter-session


#### DISPLAY MANAGER INSTALLATION [gdm] (display manager for Gnome)
	pacman -S gdm
	systemctl enable gdm


#### FONTS
	pacman -S terminus-font ttf-ubuntu-font-family ttf-roboto ttf-freefont ttf-inconsolata ttf-font-awesome ttf-dejavu ttf-liberation ttf-droid noto-fonts noto-fonts-extra noto-fonts-cjk noto-fonts-emoji ttf-fira-sans ttf-fira-mono adobe-source-serif-pro-fonts adobe-source-sans-pro-fonts adobe-source-code-pro-fonts

	yay -S siji
	
	git clone https://aur.archlinux.org/ttf-material-design-icons-git.git
	cd ttf-material-icons-git
	makepkg -si

	yay -S nerd-fonts-complete


#### SUBLIME-TEXT
- Installed plugins:

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

- Theme:
	- Predawn


#### RKHUNTER
	pacman -S rkhunter
	sudo rkhunter --versioncheck
	sudo rkhunter --update
	sudo rkhunter --propupd
	
	sudo rkhunter --check
	OR
	sudo rkhunter --check --rwo --sk


#### ENABLE HIBERNATION
- make sure to have a swap partition with size 1.5 x RAM size
- inside file /etc/mkinitcpio.conf:
	- add "resume" hook to HOOKS:
		```
		HOOKS=(base udev autodetect modconf block filesystems keyboard resume fsck)
		```

```
sudo mkinitcpio -P
```
- inside file /etc/default/grub:
	- run `sudo blkid /dev/sdaY -s UUID` to get swap partition UUID
	- add swap partition UUID to resume kernel parameter: `GRUB_CMDLINE_LINUX_DEFAULT="resume=UUID=<swap_partition_uuid>"`

```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
- reboot computer


#### DISABLE BLUETOOTH
	rfkill list
	rkkill block <bluetooth_device>


#### INSTALL CODING PROGRAMS
	pacman -S vscode

##### INSTALL CONDA
- follow the instructions here: https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
	
	```
	conda env list
	conda update conda
	# python_ver example: 3.8
	conda create --name <env_name> python=<python_ver>
	# using conda with zsh
	conda init zsh
	conda config --set auto_activate_base false
	
	conda activate <env_name>
	conda deactivate
	```

##### INSTALL C, C++, PYTHON
- it's likely that **gcc**, **g++** and **python3** are already installed

##### INSTALL JAVA (OpenJDK)
	pacman -S jre-openjdk
	pacman -S jdk-openjdk

	javac --version
	java --version

##### INSTALL DOCKER
	pacman -S docker
	pacman -S docker-compose

	systemctl enable --now docker

##### INSTALL C#
	pacman -S dotnet-runtime
	pacman -S dotnet-sdk

- install useful VSCode extensions


#### INSTALL BOOTISO
	yay -S bootiso


#### INSTALL SNAP [OPTIONAL]
	# installation
	yay -S snapd
	systemctl enable --now snapd.socket
	systemctl enable --now snapd.service
	systemctl enable --now snapd.apparmor
	ln -s /var/lib/snapd/snap /snap

	# test installation
	snap install hello-world
	hello-world
	snap remove hello-world


#### INSTALL NIX
	# installation
	pacman -S nix
	systemctl enable --now nix-daemon.service
	usermod -aG nix-users riccardo

	# add channel
	nix-channel --add https://nixos.org/channels/nixpkgs-unstable
	nix-channel --update

	# test installation
	nix-env -iA nixpkgs.hello
	hello
	nix-env --uninstall hello


##### INSTALL NIX ZSH COMPLETIONS
	cd ~/oh-my-zsh/custom/plugins
	git clone git@github.com:spwhitt/nix-zsh-completions.git

- add `nix-zsh-completions` to plugins list in .zshrc

- append `prompt_nix_shell_setup` in .zshrc so we get the prefix [nix-shell] when we are in a nix-shell
