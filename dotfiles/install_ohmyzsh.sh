#!/bin/bash

# Installs ohmyzsh if it is not already installed.
if [ ! -d ~/.oh-my-zsh ]
then
    echo "Install ohmyzsh"
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc
fi
