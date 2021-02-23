#!/bin/bash

ZSH_FZF_TMUX_INSTALL=(

    'zsh'
    'zsh-antigen'
    'tmux'

)

PYTHON_DEVELOPMENT_INSTALL=(

    'ranger'
    'xclip'
    'git'
    'neovim'
    'python'
    'python-pip'
    'npm'
    'fzf'
    'fd'
    'ripgrep'
    'nodejs'

)

PYTHON_PIP_INSTALL=(

    'black'                         # Formatter
    'flake8'                        # Linter
    'numpy'                         # Advanced math
    'requests'                      # HTTPS related accessibility/ease
    'matplotlib'                    # Plotting library
    'jedi'                          # Autocompletion
    'neovim'                        # Neovim support
    # 'pandas'                        # Dataframe management
    # 'Pillow'                        # Image classification
    # 'moviepy'                       # Video classification
    # 'torch'                         # Pytorch
    # 'pyqt5'                         # GUI builder
    # 'pyqt5-tools'                   # Tools for pyqt5

	)

# ZSH_FZF_TMUX_INSTALL
while true; do
    read -p "Install ZSH_FZF_TMUX_INSTALL portion? (y/n): " yn
    case $yn in
        [Yy]* )
            for PKG in "${ZSH_FZF_TMUX_INSTALL[@]}"; do
                if dpkg -s "$PKG" > /dev/null ; then
                    echo ""$PKG" is already installed."
                else
                    echo ""$PKG" not installed. Installing..."
                    apt -y install "$PKG"
                fi
            done
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""

# PYTHON_DEVELOPMENT_INSTALL
while true; do
    read -p "Install PYTHON_DEVELOPMENT_INSTALL portion? (y/n): " yn
    case $yn in
        [Yy]* )
            for PKG in "${PYTHON_DEVELOPMENT_INSTALL[@]}"; do
                if dpkg -s "$PKG" > /dev/null ; then
                    echo ""$PKG" is already installed."
                else
                    echo ""$PKG" not installed. Installing..."
                    apt -y install "$PKG"
                fi
            done
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""

# PYTHON_PIP_INSTALL
while true; do
    read -p "Install PYTHON_PIP_INSTALL portion? (y/n): " yn
    case $yn in
        [Yy]* )
            for PKG in "${PYTHON_PIP_INSTALL[@]}"; do
                    apt -y install "$PKG"
            done
            break;;
        [Nn]* )
            break;;
    esac
done
echo ""


