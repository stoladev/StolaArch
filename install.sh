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
    'python-pynvim'

    # FZF
    'fzf'
    'fd'
    'ripgrep'
    'the_silver_searcher'


    # Bash
    'bash-completion'
	'file-roller'


    # FTP
	'filezilla'

    
	# Email and Chat
	'thunderbird'
	'discord'


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



