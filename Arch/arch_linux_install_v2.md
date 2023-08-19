## PREINSTALLATION (1)

### SET KEYBOARD LAYOUT

```bash
loadkeys it
```

### VERIFY BOOT MODE [OPTIONAL (only for UEFI)]

```bash
ls /sys/firmware/efi/efivars
```

### CONNECT TO INTERNET

- using `iwctl`:

```bash
iwctl
```

- inside `iwctl`:

```
device list
station <device> scan
station <device> get-networks
station <device> connect <SSID>
device <device> show
```

- after connection:

```bash
ping www.google.it
```

### UPDATE SYSTEM CLOCK

```bash
timedatectl set-local-rtc true
timedatectl set-ntp true
```

### SELECT MIRRORS

```bash
vim /etc/pacman.d/mirrorlist
```

### SET COOL FONT FOR THE INSTALLATION PROCEDURE [OPTIONAL]

```bash
pacman -S terminus-font
setfont ter-v24b
```

### PARTITIONING (GPT UEFI)

#### PARTITIONING THE DISKS

```bash
fdisk -l
parted --align=optimal /dev/sda
```

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

```bash
mkfs.ext4 /dev/sdaX
mkswap /dev/sdaY
```

#### MOUNT FILESYSTEMS

```bash
mount /dev/sdaX /mnt
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
swapon /dev/sdaY
```


## INSTALL SYSTEM (2)

### INSTALL ESSENTIAL PACKAGES

```bash
pacstrap /mnt base base-devel linux linux-firmware
```

### FSTAB

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

### CHROOT

```bash
arch-chroot /mnt /bin/bash
```

### INSTALL USEFUL PROGRAMS

```bash
pacman -S openssh vi vim git iwd dhcpcd
```

### SET TIME ZONE

```bash
ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
```

### SET LOCALIZATION

```bash
vim /etc/locale.gen
```

- uncomment it&#95;utf-8 and it&#95;iso [for italian language] in locale.gen file

```bash
locale-gen
echo "LANG=it_IT.UTF-8" >> /etc/locale.conf
echo "KEYMAP=it" >> /etc/vconsole.conf
```

### NETWORK CONFIGURATION

```bash
vim /etc/hosts
```

- inside vim, append:
```
127.0.0.1	localhost
::1	localhost
```

### HOSTNAME

```bash
echo "Arch" >> /etc/hostname
```

### INTEL-UCODE

```bash
pacman -S intel-ucode
```

### INITRAMFS

```bash
mkinitcpio -p linux
```

### BOOTLOADER [GRUB (UEFI)]

```bash
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot/efi --recheck /dev/sda
```

- inside `/etc/default/grub`:
	- enable recovery generation
	- enable os-prober

- outside `/etc/default/grub`:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

(**note**: this will not find Windows)

### SET ROOT PASSWORD

```bash
passwd
```

### REBOOT

```bash
exit
umount -R /mnt
systemctl reboot
```

## POST INSTALLATION (3)

### CONNECT TO INTERNET

```bash
systemctl enable --now dhcpcd
systemctl enable --now iwd
```

- using `iwctl`:

```bash
iwctl
```

- inside `iwctl`:

```
device list
station <device> scan
station <device> get-networks
station <device> connect <SSID>
device <device> show
```

- after connection:

```bash
ping www.google.it
```

### UPDATE SYSTEM CLOCK (timedatectl)

```bash
timedatectl set-local-rtc true
timedatectl set-ntp true
hwclock --systohc --utc
```

### SET LOCALIZATION (localectl)

```bash
localectl set-x11-keymap it
```

### GRUB CONFIGURATION

```bash
vim /etc/default/grub
```

- inside vim:
	- remove "loglevel=3 quite" in GRUB_CMDLINE_LINUX_DEFAULT
	
- outside vim:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

(**note**: this will find Windows)

### INSTALL AUR Helper [YAY]

```bash
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
yay -Y --gendb
yay -Y --devel --save
```

### XORG INSTALLATION [MINIMAL]

```bash
pacman -S xorg xorg-server xorg-apps xorg-xinit xorg-fonts xterm xorg-xhost xorg-xrandr
```

#### GRAPHICS DRIVERS

```bash
pacman -S mesa mesa-utils 
```

#### OPTIONAL GRAPHICS DRIVERS

```bash
pacman -S xf86-video-intel xf86-video-nouveau vulkan-intel vulkan-mesa-layers
```

#### GENERATE XORG CONFIG (before startx)

```bash
X -configure
```

- copy `xorg.conf.new` file in directory `/etc/X11` as `xorg.conf`
- inside `xorg.conf` file, for both devices `Card0` and `Card1` (graphics cards) choose Driver `modesetting`
- after `startx` you can see xorg log in file `/var/log/Xorg.0.log`
- you can test graphics card with command line program `glxgears`

### USER CREATION

```bash
useradd -m -g wheel -s /bin/bash riccardo
passwd riccardo
visudo
```

- inside `visudo`, uncomment `wheel` and save

### AUDIO

```bash
pacman -Sy pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack wireplumber qpwgraph
```

- with newly created user (`su riccardo`):

```bash
systemctl --user status pipewire-pulse.service
```

### DESKTOP ENVIRONMENT INSTALLATION [XFCE]

```bash
pacman -Sy xfce4 xfce4-goodies
```

#### XORG CONFIG

- with newly created user (`su riccardo`):

```bash
echo "exec startxfce4" > .xinitrc
```

### OTHER USEFUL CLI PROGRAMS

```bash
pacman -S archey3 wget parted gparted htop stow fd fzf tree ripgrep ripgrep-all entr bat jq qrencode feh sxiv imagemagick ffmpeg speedtest-cli redshift nnn neovim zip unzip
```

- for gparted:

```bash
pacman -S dosfstools jfsutils f2fs-tools btrfs-progs exfatprogs ntfs-3g reiserfsprogs udftools xfsprogs nilfs-utils gpart mtools
```

### FONTS

```bash
yay -S all-repository-fonts
```

### OTHER USEFUL PROGRAMS

```bash
pacman -S mpv vlc alacritty arandr python python-pip python-pipx
yay -S google-chrome sublime-text
pipx install gita
pipx install grip
```

### DISABLE BEEP IN CONSOLE TAB [OPTIONAL]

```bash
pacman -S vim /etc/inputrc
```

- inside file `/etc/inputrc`: uncomment `set bell-style none`

### PROGRAMMING

```bash
pacman -S npm python-poetry pandoc-cli python-black git-delta vscode
```

### ZSH (CONFIG WITH OH-MY-ZSH)

```bash
pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

- enable useful plugins:
	- add `git` to plugins list in `.zshrc`
	- add `jump` to plugins list in `.zshrc`
	- add `fd` to plugins list in `.zshrc`
	- add `fzf` to plugins list in `.zshrc`

- install useful custom plugins:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
```

- enable custom plugins:
	- add `zsh-syntax-highlighting` to plugins list in `.zshrc`
	- add `zsh-autosuggestions` to plugins list in `.zshrc`
	- add `zsh-completions` to plugins list in `.zshrc`

### WINDOW MANAGER INSTALLATION [i3]

```bash
pacman -S i3-gaps
```

#### WM ADDON PROGRAMS [i3]

```bash
pacman -S dmenu rofi numlockx gvim xclip xorg-xfd rxvt-unicode dunst
```

### DISPLAY MANAGER INSTALLATION [lightdm] (for XFCE, not for Gnome)

```bash
pacman -S lightdm lightdm-gtk-greeter
systemctl enable lightdm
```

- inside file `/etc/lightdm/lightdm.conf`:
	- add `lightdm-gtk-greeter` to `greeter-session`

### RKHUNTER
```bash
pacman -S rkhunter
sudo rkhunter --versioncheck
sudo rkhunter --update
sudo rkhunter --propupd

sudo rkhunter --check
OR
sudo rkhunter --check --rwo --sk
```

### ENABLE HIBERNATION
- make sure to have a swap partition with size 1.5 x RAM size
- inside file `/etc/mkinitcpio.conf`:
	- add `resume` hook to HOOKS:
		```
		HOOKS=(base udev autodetect modconf block filesystems keyboard resume fsck)
		```

```bash
sudo mkinitcpio -P
```
- inside file `/etc/default/grub`:
	- run `sudo blkid /dev/sdaY -s UUID` to get swap partition UUID
	- add swap partition UUID to resume kernel parameter: `GRUB_CMDLINE_LINUX_DEFAULT="resume=UUID=<swap_partition_uuid>"`

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
- reboot computer

### INSTALL BLUETOOTH (and disable it)

```bash
pacman -S bluez bluez-utils
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth
```

- inside file `/etc/bluetooth/main.conf`:
```
[Policy]
AutoEnable=false
```

#### DISABLE BLUETOOTH with rfkill
```bash
rfkill list
rkkill block <bluetooth_device>
```

### INSTALL CONDA
- follow the instructions here: https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
	
```bash
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

### INSTALL C, C++, PYTHON
- it's likely that **gcc**, **g++** and **python3** are already installed

### INSTALL JAVA (OpenJDK)

```bash
pacman -S jre-openjdk
pacman -S jdk-openjdk

javac --version
java --version
```

### INSTALL NIX

```bash
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
```

#### INSTALL NIX ZSH COMPLETIONS

```bash
cd ~/oh-my-zsh/custom/plugins
git clone git@github.com:spwhitt/nix-zsh-completions.git
```

- add `nix-zsh-completions` to plugins list in .zshrc

- append `prompt_nix_shell_setup` in .zshrc so we get the prefix [nix-shell] when we are in a nix-shell

### FIREWALL [UFW]

```bash
pacman -S ufw
sudo systemctl enable --now ufw
sudo ufw enable
sudo ufw status verbose
```

### NETWORK MANAGER
```bash
pacman -S networkmanager nm-connection-editor network-manager-applet
systemctl disable dhcpcd
systemctl stop dhcpcd
```

- inside file `/etc/NetworkManager/conf.d/iwd.conf`:

```
[device]
wifi.backend=iwd
```

```bash
sudo systemctl stop NetworkManager
sudo systemctl disable --now wpa_supplicant
sudo systemctl enable --now NetworkManager
sudo systemctl status NetworkManager
ping www.google.it
```
