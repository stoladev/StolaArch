

echo
echo "Installing packages..."
echo 

cd "${HOME}"

echo "Cloning YAY..."
git clone "https://aur.archlinux.org/yay.git"

echo "Cloning WhatsApp..."
git clone "https://aur.archlinux.org/whatsapp-web-desktop"

PKGS=(

	#CRUCIAL				
	'linux-lts'
	'linux-lts-headers'
	'linux-firmware'	
	'hardinfo'								
	'neofetch'								
	'speedtest-cli'							

	#AUDIO
	'alsa-plugins'
	'pulseaudio'
	'pulseaudio-alsa'
	'pavucontrol'

	#BLUETOOTH
	'bluez'
	'bluez-utils'
	'bluez-firmware'
	'blueberry'
	'pulseaudio-bluetooth'
	'bluez-libs'

	#DEVELOPMENT
	'avahi'
	'clang'
	'cmake'
	'gcc'
	'glibc'
	'nodejs'
	'npm'
	'zsh'									
	'zsh-completions'	
	'bash-completion'	
	'cronie'								
	'file-roller'		
	'qtcreator'
	'qt5-examples'
	'filezilla'
	'gimp'
	'ristretto'
	'virtualbox'
	'virtualbox-host-modules-arch'

	#SECURITY
	'bleachbit'
	'veracrypt'

	#MEDIA
	'vlc'
	'obs-studio'

	#GAMES
	'minecraft-launcher'

	#STYLE
	'slimlock'

	)

sudo pacman -S base-devel --noconfirm --needed

cd ${HOME}/yay
makepkg -si --noconfirm --needed

yay -S gconf nodejs-nativefier gtk2 --noconfirm --needed

cd ${HOME}/whatsapp-web-desktop/
makepkg -si --noconfirm --needed

for PKG in "${PKGS[@]}"; do
	yay -S --noconfirm $PKG
done

echo
echo "Installation complete."
echo "Please reboot."
echo


