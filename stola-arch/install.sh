#!/bin/bash


PKGS=(


    # LTS Kernel Safety
    'linux-lts'                     # Long term support kernel
    'linux-lts-headers'             # LTS headers
    'linux-firmware'                # Necessary firmware


    # Uncalled Dependencies         # Dependencies that don't get called
    'avahi'
    'cmake'
    'rust'


    # Default Programs
    'networkmanager'                # Network manager
    'zsh'                           # Superior bash
    'antigen'                       # Plugin manager for ZSH
    'tmux'                          # Terminal wrapper to make CLI a breeze
    'filezilla'                     # FTP client
    'thunderbird'                   # Email client
    'whatsapp-nativefier-dark'      # WhatsApp client
    'alsa-utils'                    # Alsa utilities
    'pulseaudio-alsa'               # Pulseaudio manager interface with alsa
    'pulseaudio'                    # Audio manager
    'asoundconf'                    # Default sound config that just works(TM)
    'obs-studio'                    # Best recording software hands down
    'vlc'                           # Audio/video codecs, player
    'scrot'                         # Screenshotter
    'maim'                          # Screenshotter alternative
    'ranger'                        # CLI directory/file browser
    'xclip'                         # Clipboard manager
    'arandr'                        # Monitor adjuster
    'youtube-dl'                    # Easy video/audio downloading
    'amdvlk'                        # Graphics driver, Open
    'vulkan-radeon'                 # Graphics driver, RADV, part of Mesa project
    'zenith'                        # HTOP but in rust and better
    'ncspot'                        # Spotify ncurses player
    'qbittorrent'                   # Torrent client


    # Development
    'git'                           # Git access
    'neovim'                        # Best and most malleable text editor by far
    'zathura'                       # PDF and similar editor
    'xcape'                         # Allows for multi-function combos, i.e. spacebar modifier
    'xorg-xmodmap'                  # Keyboard remaps i.e. caps to escape
    'python'                        # Python development
    'python-pip'                    # Pip install
    'npm'                           # Package manager for js


    # Fuzzy File Searching
    'fzf'                           # Fuzzy file finder
    'fd'                            # FZF alternative with other functions
    'ripgrep'                       # grep but with rust, blazing fast


    # Misc Utilities
    'ueberzug'                      # Allows image viewing within terminal
    'picom'                         # Formerly compton; transparency engine
    'feh'                           # Image viewer, used for background wallpapers
    'wireguard-lts'                 # LTS version of wireguard for VPN
    'wireguard-tools'               # Misc wireguard tools for troubleshooting
    'font-manager'                  # Font manager
    'qtfm'                          # Qt based file manager


    # Fonts
    'ttf-iosevka'
    'ttf-iosevka-term'
    'ttf-iosevka-term-ss04'
    'ttf-symbola'
    'noto-fonts-emoji'
    'ttf-joypixels'
    'powerline-fonts'


	)


# YAY Installation
if pacman -Qs yay > /dev/null ; then
    echo "yay is already installed."
else
    cd "${HOME}/git" || exit
    git clone "https://aur.archlinux.org/yay.git"
    cd "${HOME}/git"/yay || exit
    sudo pacman -S base-devel --noconfirm --needed
    makepkg -si --noconfirm --needed
fi


# PKG Installation
for PKG in "${PKGS[@]}"; do
    if pacman -Qs "$PKG" > /dev/null ; then
        echo ""$PKG" is already installed."
    else
        echo ""$PKG" not installed. Installing..."
	    yay -S --noconfirm "$PKG"
    fi
done


# Latest Updates
echo "Checking for updates..."
sudo pacman -Syu --noconfirm --needed

