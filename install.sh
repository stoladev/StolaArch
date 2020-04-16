# ____ ___ ____ _    ____ ___  ____ _  _
# [__   |  |  | |    |__| |  \ |___ |  |
# ___]  |  |__| |___ |  | |__/ |___  \/
#

# Installation protocol for post ArchBang
# ToDo: include all recommended components for base Arch
# ToDo: make separate installer for base Arch in the future


PKGS=(

	# Crucial
	'linux-lts'
	'linux-lts-headers'
	'linux-firmware'
	'hardinfo'
	'speedtest-cli'
	'libimobiledevice'

	# Audio
	'alsa-plugins'
	'pulseaudio'
	'pulseaudio-alsa'
	'pavucontrol'

	# Bluetooth
	# ToDo: Bluetooth isn't working for some reason. Probably due to overlapping programs. Fix on own system.
	'bluez'
	'bluez-utils'
	'bluez-firmware'
	'blueberry'
	'pulseaudio-bluetooth'
	'bluez-libs'

	# Development
	# ToDo: Recheck programs that see actual use. Don't want bloatware for no reason. You don't even program in nodejs.
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
	'file-roller'
	'filezilla'
	'gimp'

	# Media
	'vlc'
	'obs-studio'

	# Email and Chat
	'thunderbird'
	'discord'

	# Style
	# ToDo: Add more style components.
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

# End
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
