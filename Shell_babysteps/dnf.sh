#!/usr/bin/bash

#Clear dnf cache
ls -lh /var/cache/dnf/
if sudo dnf clean all; then
        echo "DNF cache has neen cleared"
else
        echo "ERROR cache clear"
        exit 1
fi
echo "Check dns cahe again"
ls -lh /var/cache/dnf/

#In the dnf configuration file, enable storing downloaded packages in the cache.
DNF_CONF="/etc/dnf/dnf.conf"

if [ -f "$DNF_CONF" ]; then
        if ! grep -q '^keepcache=True' "$DNF_CONF"; then
                sudo echo "keepcache=True" >> "$DNF_CONF"
        else
                echo "This option already exists in $DNF_CONF"
        fi
else
        echo "Configure file $DNF_CONF is doesn't exist"
        exit 1
fi

#Install nmap-ncat and htop
NMAP="nmap-ncat"
HTOP="htop"
sudo dnf remove "$NMAP"
sudo dnf remove "$HTOP"

if ! sudo dnf install -y "$NMAP"; then
        echo "Error install $NMAP"
fi

if ! sudo dnf install -y "$HTOP"; then
        echo "Error install $HTOP"
fi

echo "Check status installing"
dnf info "$NMAP"
dnf info "$HTOP"

#Add repo EPEL
sudo dnf remove oracle-epel-release-el9

sudo dnf install oracle-epel-release-el9

#Again install
if ! command -v ncat > /dev/null; then
        if sudo dnf install -y "$NMAP"; then
                echo "Package $NMAP has been successful installed"
        fi
else
        echo "Error install $NMAP"

fi

if ! command -v htop > /dev/null; then
        if sudo dnf install -y "$HTOP"; then
                echo "Package $HTOP has been successful installed"
        fi
else
        echo "Error install $HTOP"

fi

#Check util
ncat --version
htop --version

#Determine which package the file '/etc/sysctl.conf' belongs to
rpm -qf /etc/sysctl.conf

#Delete nmap-ncat
sudo dnf remove "$NMAP"

exit 0
