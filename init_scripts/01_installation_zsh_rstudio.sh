#!/usr/bin/env bash

# install zsh
sudo apt-get update
sudo apt install -y zsh

# run as rstudio
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
runuser -l rstudio -c ' git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc &&\
  chsh -s $(which zsh)'

echo \
    "
    setHook('rstudio.sessionInit', function(newSession) {
        if (newSession && identical(getwd(), path.expand('~')))
        {
            message('Zsh')
            rstudioapi::writeRStudioPreference('posix_terminal_shell', 'zsh')
            }
            }, action = 'append')
            " >> /home/rstudio/.Rprofile
