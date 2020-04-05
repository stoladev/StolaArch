# ____ ___ ____ _    ____ ___  ____ _  _ 
# [__   |  |  | |    |__| |  \ |___ |  | 
# ___]  |  |__| |___ |  | |__/ |___  \/  
#                                        

# Installation protocol for post ArchBang
# Does not include all recommended components for base Arch
# Will make separate installer for base Arch in the future

# DATA
PKGS=(

	# CRUCIAL				
	'linux-lts'
	'linux-lts-headers'
	'linux-firmware'	
	'hardinfo'								
	'neofetch'								
	'speedtest-cli'			
	'libimobiledevice'				

	# AUDIO
	'alsa-plugins'
	'pulseaudio'
	'pulseaudio-alsa'
	'pavucontrol'

	# BLUETOOTH
	'bluez'
	'bluez-utils'
	'bluez-firmware'
	'blueberry'
	'pulseaudio-bluetooth'
	'bluez-libs'

	# DEVELOPMENT
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
	'playonlinux'

	# SECURITY
	# Wait a minute... why would I tell you what security packages I use?

	# MEDIA
	'vlc'
	'obs-studio'
	'youtube-dl'
	
	# EMAIL & CHAT
	'thunderbird'
	'discord'

	# GAMES
	'minecraft-launcher'
	'steam'
	'wine'
	'proton'
	'lutris'

	# STYLE
	'slimlock'

	)

# START POINT
echo "
___  ____ ____ _ _  _ _  _ _ _  _ ____                 
|__] |___ | __ | |\ | |\ | | |\ | | __                 
|__] |___ |__] | | \| | \| | | \| |__]                                                                  
_ _  _ ____ ___ ____ _    _    ____ ___ _ ____ _  _    
| |\ | [__   |  |__| |    |    |__|  |  | |  | |\ |    
| | \| ___]  |  |  | |___ |___ |  |  |  | |__| | \| ...
                                                       
"

sleep 5

# YAY INSTALLATION
cd "${HOME}"
git clone "https://aur.archlinux.org/yay.git"

cd ${HOME}/yay
sudo pacman -S base-devel --noconfirm --needed
makepkg -si --noconfirm --needed

# WHATSAPP INSTALLATION
cd "${HOME}"
git clone "https://aur.archlinux.org/whatsapp-web-desktop"

yay -S gconf nodejs-nativefier gtk2 --noconfirm --needed
cd ${HOME}/whatsapp-web-desktop/
makepkg -si --noconfirm --needed

# SUBLIME INSTALLATION
curl -O https://download.sublimetext.com/sublimehq-pub.gpg
sudo pacman-key --add sublimehq-pub.gpg
sudo pacman-key --lsign-key 8A8F901A
rm sublimehq-pub.gpg

#PKG INSTALLATION
for PKG in "${PKGS[@]}"; do
	yay -S --noconfirm $PKG
done

# END POINT
echo "
_ _  _ ____ ___ ____ _    _    ____ ___ _ ____ _  _    
| |\ | [__   |  |__| |    |    |__|  |  | |  | |\ |    
| | \| ___]  |  |  | |___ |___ |  |  |  | |__| | \|    
____ ____ _  _ ___  _    ____ ___ ____                 
|    |  | |\/| |__] |    |___  |  |___                 
|___ |__| |  | |    |___ |___  |  |___ .

___  _    ____ ____ ____ ____                          
|__] |    |___ |__| [__  |___                          
|    |___ |___ |  | ___] |___                          
____ ____ ___  ____ ____ ___                           
|__/ |___ |__] |  | |  |  |                            
|  \ |___ |__] |__| |__|  |  .

"
