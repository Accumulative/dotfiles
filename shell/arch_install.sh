loadkeys uk

# verify uefi
ls /sys/firmware/efi/efivars

# connect to wifi
iwctl
station wlan0 scan
# station wlan0 get-networks
station wlan0 connect elecom-0d10d3

# disks
fdisk -l
mkfs.ext4 /dev/sda2

# pacman
pacman -Syy
pacman -S reflector
reflector -c "Australia" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

# mount
mount /dev/nvme0n1p2 /mnt

# install
pacstrap /mnt base base-devel linux linux-firmware vim git nano

# fstab
genfstab -U /mnt >>/mnt/etc/fstab

# chroot
arch-chroot /mnt

# timezone
ln -sf /usr/share/zoneinfo/Japan /etc/localtime
hwclock --systohc

# locale
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 >/etc/locale.conf

# hostname
echo arch >/etc/hostname

# hosts
echo "
127.0.0.1	localhost
::1		localhost
127.0.1.1	myarch
" >/etc/hosts

# root password
passwd

# sudo
pacman -S sudo
useradd -m kieran
passwd kieran
usermod -aG wheel,audio,video,optical,storage kieran
visudo # uncomment %wheel ALL=(ALL) ALL

# desktop
pacman -S xorg networkmanager
systemctl enable NetworkManager

# grub
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# exit
exit

# reboot
reboot

# network manager
nmcli device wifi list
nmcli device wifi connect elecom-0d10d3 password 12345678

# awesome
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/awesome-git.git
cd awesome-git
makepkg -si

pacman -S xorg xorg-xinit xorg-xrandr xorg-xsetroot xorg-xset
