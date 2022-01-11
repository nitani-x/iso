#!/usr/bin/env bash

# Made by Fernando "maroto"
# Run anything in the filesystem right before being "mksquashed"
# ISO-NEXT specific cleanup removals and additions (08-2021 + 10-2021) @killajoe and @manuel
# refining and changes november 2021 @killajoe and @manuel

script_path=$(readlink -f "${0%/*}")
work_dir="work"

# Adapted from AIS. An excellent bit of code!
# all pathes must be in quotation marks "path/to/file/or/folder" for now.

arch_chroot(){
    arch-chroot "${script_path}/${work_dir}/x86_64/airootfs" /bin/bash -c "${1}"
}

do_merge(){

arch_chroot "$(cat << EOF
##############################
# start chrooted commandlist #
##############################
# prepare livesession settings and user
sed -i 's/#\(en_US\.UTF-8\)/\1/' "/etc/locale.gen"
locale-gen
ln -sf "/usr/share/zoneinfo/UTC" "/etc/localtime"
#set root permission and shell
chmod -R 700 "/root"
chown root:root -R "/root"
usermod -s /usr/bin/bash root
useradd -m -p "" -g users -G 'sys,rfkill,wheel,uucp,nopasswdlogin,adm,tty' -s /bin/bash liveuser
# insert special desktop settings for installer livesession
# placing needed config files for user tools
# fixing permission on other file paths
chmod 755 "/etc/sudoers.d"
mkdir -p "/media"
chmod 755 "/media"
chmod 440 "/etc/sudoers.d/g_wheel"
chown 0 "/etc/sudoers.d"
chown 0 "/etc/sudoers.d/g_wheel"
chown root:root "/etc/sudoers.d"
chown root:root "/etc/sudoers.d/g_wheel"
chmod 755 "/etc"
# fix configurations
sed -i 's/#\(PermitRootLogin \).\+/\1yes/' "/etc/ssh/sshd_config"
# archiso now has a /airootfs/etc/systemd/journald.conf.d/volatile-storage.conf
#sed -i 's/#\(Storage=\)auto/\1volatile/' "/etc/systemd/journald.conf"
# archiso now has /airootfs/etc/systemd/logind.conf.d/do-not-suspend.conf
#sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' "/etc/systemd/logind.conf"
#sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' "/etc/systemd/logind.conf"
#sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' "/etc/systemd/logind.conf"
# enable systemd services
systemctl enable display-manager.service
systemctl enable bluetooth.service
systemctl enable NetworkManager.service
systemctl set-default multi-user.target
# revert from arch-iso preset to default preset
cp -rf "/usr/share/mkinitcpio/hook.preset" "/etc/mkinitcpio.d/linux.preset"
sed -i 's?%PKGBASE%?linux?' "/etc/mkinitcpio.d/linux.preset"
# remove unneeded grub stuff from /boot
# rm "/boot/grub/grub.cfg" #archiso does not create it anymore
rm -R "/boot/syslinux"
rm -R "/boot/memtest86+"
rm "/boot/amd-ucode.img"
rm "/boot/initramfs-linux.img"
rm "/boot/intel-ucode.img"
rm "/boot/vmlinuz-linux"
#rm "/var/log/pacman.log"
# custom fixes currently needed:
############################
# end chrooted commandlist #
############################
EOF
)"
}

#################################
########## STARTS HERE ##########
#################################

do_merge