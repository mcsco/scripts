#!/bin/sh

# Making sure you have unarchiver
distro=`lsb_release -is`

cd ~/Downloads/

if [ $distro = "Debian" ] || [ $ditro = "Ubuntu" ]; then
    sudo apt install unzip cups
    # Retrieve brother gz file
    wget "https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.3-1.gz"
    gunzip linux-brprinter-installer-*.*.*-*.gz
    sudo bash linux-brprinter-installer-2.2.3-1 MFC-L2750DW

elif [ $distro = "Fedora" ] || [ $distro = "NobaraLinux" ]; then
    wget "https://download.brother.com/welcome/dlf006893/linux-brprinter-installer-2.2.3-1.gz"
    gunzip linux-brprinter-installer-*.*.*-*.gz
    sudo bash linux-brprinter-installer-2.2.3-1 MFC-L2750DW
fi

# Clean up
mkdir -vp ~/Downloads/brprinter
mv brscan* ~/Downloads/brprinter/
mv linux-brprinter* ~/Downloads/brprinter/
mv mfcl2750dw* ~/Downloads/brprinter/
mv uninstaller* ~/Downloads/brprinter/

cd ~/
