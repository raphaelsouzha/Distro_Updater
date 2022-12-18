#!/bin/bash
# Add support to flathub
echo "To update your distro, type what's base is it:"
read distro
if [ $distro = "Fedora" ] || [ $distro = "fedora" ]
    then
    echo "Updating the cache and check if Fedora have some upgrade to do"
    sudo dnf update -y
    sudo dnf upgrade -y
        echo "Enabling flahub to your system:"
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        echo -e "\nFlathub repo has been added to your system!"
        echo -e "Do you wanna install Discord, Spotfy, Telegram, or other app from flathub?"
        echo "Default answer can be [Sim | Não] or [Yes | No]"
        read resposta
        if [ $resposta = "yes" ] || [ $resposta = "Yes" ] || [ $resposta = "sim" ] || [ $resposta = "Sim" ]
            then
                flatpak install flathub com.discordapp.Discord -y
                flatpak install flathub com.spotify.Client -y
                flatpak install flathub org.telegram.desktop -y
                flatpak install flathub com.transmissionbt.Transmission -y
        else
            echo -e "\nYou don't want to install anything!"
            exit 0
        fi

        # This part is for rpm install programs
        echo -e "\n Now we'll install programs from rpm packages."
        echo "I selected some programs what I think it's very important to development, as Virtual Studio code, and others..."
        cd ~/Downloads
            # Variables to links
            atom="https://atom-installer.github.com/v1.63.1/atom.x86_64.rpm?s=1669139889&ext=.rpm"
            vscode="https://az764295.vo.msecnd.net/stable/5235c6bb189b60b01b1f49062f4ffa42384f8c91/code-1.74.0-1670260117.el7.x86_64.rpm"
            wget $atom
            wget $vscode


elif [ $distro = "debian" ] || [ $distro = "Debian" ] || [ $distro = "Ubuntu" ] || [ $distro = "ubuntu" ]
    then
        sudo apt update
        sudo apt dist-upgrade -y
        sudo apt install flatpak -y
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        echo -e "\nFlathub repo has been added on your system!"
        echo -e "\n Do you wanna install Discord, Spotfy, Telegram, or other app from flathub?"
        echo "Default answer can be [Sim | Não] or [Yes | No]"
        read resposta
        if [ $resposta = "yes" ] || [ $resposta = "Yes" ] || [ $resposta = "sim" ] || [ $resposta = "Sim" ]
            then
                flatpak install flathub com.discordapp.Discord -y
                flatpak install flathub com.spotify.Client -y
                flatpak install flathub org.telegram.desktop -y
                flatpak install flathub com.transmissionbt.Transmission -y
        fi
elif [ $distro = "arch'" ]
    then
        sudo pacman -Syu
        sudo pacman -S base-devel flatpak virtualbox
        sudo pacman -S adobe-source-han-serif-cn-fonts adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-otc-fonts adobe-source-han-serif-tw-fonts
        # Downloads from AUR
        cd ~/Downloads
            mkdir Updater
            cd Updater
            git clone https://aur.archlinux.org/visual-studio-code-bin.git
            git clone https://aur.archlinux.org/google-chrome.git

        # Downloads from Flathub
        cd
        flatpak install flathub org.qbittorrent.qBittorrent -y
        flatpak install flathub org.kde.kdenlive -y
        flatpak install flathub com.spotify.Client -y
        flatpak install flathub org.telegram.desktop -y
        flatpak install flathub com.discordapp.Discord -y
        echo "All done!"
else
    echo "Your distro, "$distro", isn't on our script roadmap!"
fi
