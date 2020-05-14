PKGS=(

    # LTS Kernel Safety
	'linux-lts'
	'linux-lts-headers'
	'linux-firmware'


    # Default Programs
    'dwm'                             # TODO Automatically set up
    'ly'                              # TODO Automatically set up
    'zsh'                             # TODO Automatically set up
	'filezilla'
	'thunderbird'
	'discord'
    'whatsapp-nativefier-dark'
	'pulseaudio'
	'obs-studio'
    'mpv'
    'maim'


    # Development
    'git'
    'neovim'
    'zathura'
    'xcape'
    'xmodmap'
    'xorg-xmodmap'
    'python'
    'python2'
    'python-pip'
    'python2-pip'
    'python-pynvim'
    'npm'
    'nodejs'
    'yarn'
	'speedtest-cli'


    # Fuzzy File Searching
    'fzf'
    'fd'
    'ripgrep'


    # Fonts
    'ttf-iosevka'
    'ttf-iosevka-term'
    'ttf-symbola'
    'noto-fonts-emoji'
    'ttf-joypixels'
    'powerline-fonts'


	# Misc Dependencies
    'avahi'
    'cmake'

	)


# System Update 
# TODO Update mirrorlist config to US 
# TODO Add multilib through pacman.conf
# TODO sudo pacman-key --init
# TODO sudo pacman-key --populate archlinux
# TODO sudo pacman -Syu


# YAY Installation
cd "${HOME}/Git/Sources" || exit
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


# Oh My Zsh Installation
# TODO Automatically set up `oh-my-zsh'


# Grub Bootloader Update
# TODO Add sudo grub-mkconfig -o
    # {LET USER CHOOSE /boot/ or /boot/efi/}/grub/grub.cfg


# Enabling Ly
# TODO systemctl enable ly
systemctl enable ly.service && systemctl disable getty@tty2.service
# systemctl disable getty@tty2.service


# Tmux

