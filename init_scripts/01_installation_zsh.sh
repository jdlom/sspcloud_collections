#!/usr/bin/env bash

# install zsh
sudo apt-get update
sudo apt install -y zsh

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

#extra step for rstudio
if [ "$(whoami)" == "rstudio" ]; then
echo \
    "
    setHook('rstudio.sessionInit', function(newSession) {
        if (newSession && identical(getwd(), path.expand('~')))
        {
            message('ZSH est maintenant le terminal par defaut')
            rstudioapi::writeRStudioPreference('posix_terminal_shell', 'zsh')
        }
    }, action = 'append')
    " >> ~/.Rprofile
fi
