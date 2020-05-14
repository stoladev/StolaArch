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
    'vlc'
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
    'tk'


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
sudo pacman-key --init && sudo pacman-key --populate archlinux
sudo pacman -Syu --noconfirm


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


# Enabling Ly
systemctl enable ly.service && systemctl disable getty@tty2.service


# Tmux Plugin Manager
# TODO Add this as a check and auto-install, just like init.vim Plug
git clone "https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"


# Oh My Zsh Installation
# TODO Add this as a check and auto-install, just like init.vim Plug
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
