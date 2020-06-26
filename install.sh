# TODO: Organize this into a seperate dir (Arch installation) since I am also 
# using Ubuntu through WSL2.

# Automatically install:
# pip3 black, vim-vint, yapf, flake8, pylint, jedi, doq, pydocstring
# Add chmods:

PKGS=(

    # LTS Kernel Safety
	'linux-lts'
	'linux-lts-headers'
	'linux-firmware'


    # Default Programs
    'ly'
    'zsh'
    'tmux'
	'filezilla'
	'thunderbird'
	'discord'
    'whatsapp-nativefier-dark'
	'pulseaudio'
	'obs-studio'
    'vlc'
    'scrot'
    'maim'
    'i3-wm'
    'i3lock'
    'xautolock'
    'i3status'
    'ranger'
    'xclip'
    'arandr'
    'youtube-dl'
    'mpd'
    'ncmpcpp'
    'amdvlk'


    # Development
    'git'
    'neovim'
    'zathura'
    'xcape'
    'xorg-xmodmap'
    'python'
    'python-pip'
    'python-pygame'
    'npm'
    'tk'
    'google-cloud-sdk'


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
cd "${HOME}/Git" || exit
git clone "https://aur.archlinux.org/yay.git"
cd "${HOME}/Git"/yay || exit
sudo pacman -S base-devel --noconfirm --needed
makepkg -si --noconfirm --needed


# PKG Installation
for PKG in "${PKGS[@]}"; do
	yay -S --noconfirm "$PKG"
done


# Enabling Ly
sudo systemctl enable ly.service && sudo systemctl disable getty@tty2.service


# Tmux Plugin Manager
# TODO Add this as a check and auto-install, just like init.vim Plug
# cd "${HOME}" || exit
# git clone "https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"


# Oh My Zsh Installation
# TODO Add this as a check and auto-install, just like init.vim Plug
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
