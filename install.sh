PKGS=(

    # LTS Kernel
	'linux-lts'
	'linux-lts-headers'
	'linux-firmware'


    # Hardware and Internet
	'hardinfo'
	'speedtest-cli'


	# Audio and Video
	'alsa-plugins'
	'pulseaudio'
	'pulseaudio-alsa'
	'pavucontrol'
	'vlc'
	'obs-studio'


	# Services/Hosts Discovery
    'avahi'


    # Compilers
    'cmake'


    # Nvim
    'neovim'
    'neovim-remote'
    'python'
    'python2'
    'python-pip'
    'python2-pip'
    'python-pynvim'
    'texlive-most'


    # Emacs
    'emacs27-git'


    # Development
    'git'
    'xorg-xmodmap'


    # FZF
    'fzf'
    'fd'
    'ripgrep'
    'the_silver_searcher'


    # Bash
    'bash-completion'
	'file-roller'


    # FTP
    'lftp'
	'filezilla'

    
	# Email and Chat
	'thunderbird'
	'discord'
    'whatsapp-nativefier'


    # Desktop Environments 
    'i3'


    # Terminal
    'termite'
    'tmux'
    'awk'
    'perl'
    'sed'


    # Display Manager
    'ly'


    # Fonts
    'ttf-iosevka'
    'ttf-iosevka-term'
    'powerline-fonts'


    # iPhone Mounting
	# 'libimobiledevice'

	)


# System Update 
# TODO Update mirrorlist config to US 
# TODO Add multilib through pacman.conf
# TODO sudo pacman-key --init
# TODO sudo pacman-key --populate archlinux
# TODO sudo pacman -Syu


# YAY Installation
cd "${HOME}" || exit
git clone "https://aur.archlinux.org/yay.git"
cd "${HOME}"/yay || exit
sudo pacman -S base-devel --noconfirm --needed
makepkg -si --noconfirm --needed


# PKG Installation
for PKG in "${PKGS[@]}"; do
	yay -S --noconfirm "$PKG"
done


# PKG Remover
# TODO Add PKG_REMOVE, removing unnecessary packages


# Grub Bootloader Update
# TODO Add sudo grub-mkconfig -o
    # {LET USER CHOOSE /boot/ or /boot/efi/}/grub/grub.cfg


# Doom Emacs Installation
# TODO Prompt user if they want to install Doom Emacs
git clone --depth 1 "https://github.com/hlissner/doom-emacs" ~/.emacs.d
~/.emacs.d/bin/doom install


# Enabling Ly
# TODO systemctl enable ly
# systemctl disable getty@tty2.service


# Tmux
# TODO Setting up Tmux with gpakosz/.tmux
