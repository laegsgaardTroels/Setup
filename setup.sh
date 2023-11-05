#!/bin/bash

if ! command -v brew &> /dev/null
then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if ! command -v make &> /dev/null
then
    echo "Installing make"
    brew install make
fi

make -C homebrew-packages
make -C git
make -C dotfiles

if [ ! -d ~/.oh-my-zsh ]
then
    echo "Install ohmyzsh"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

