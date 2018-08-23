#!/bin/sh -xe

#Setup locales
apt install -y locales
#Install xfce, wicd
apt install -y xorg acpi-support lightdm tasksel dpkg librsvg2-common xorg xserver-xorg-input-libinput alsa-utils anacron avahi-daemon eject iw libnss-mdns xdg-utils lxqt wicd-daemon wicd wicd-curses wicd-gtk xserver-xorg-input-synaptics
#Copy in acpi, pulse audio, trackpad settings, funtion key settings
cp -rf /os_configs/default.pa /etc/pulse/default.pa
mkdir /etc/acpi
cp -rf /os_configs/sound.sh /etc/acpi/sound.sh
mkdir /etc/acpi/events
cp -rf /os_configs/headphone-acpi-toggle /etc/acpi/events/headphone-acpi-toggle
mkdir /etc/X11/xorg.conf.d/
cp -rf /os_configs/50-synaptics.conf /etc/X11/xorg.conf.d/

locale-gen

echo " Enter new username: "
read username
adduser $username
usermod -a -G sudo,netdev $username


reboot
