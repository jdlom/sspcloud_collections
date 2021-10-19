#!/usr/bin/env bash

echo "execution of $@"

# install zsh
echo installation zsh
sudo apt-get update
sudo apt install -y zsh

# install oh my zsh
echo install oh my zh
runuser -l $THE_USER -c ' git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc'
sudo chsh $THE_USER -s $(which zsh)

#extra step for rstudio
if [ "$THE_USER" == "rstudio" ]; then
echo \
    "
    setHook('rstudio.sessionInit', function(newSession) {
        if (newSession && identical(getwd(), path.expand('~')))
        {
            message('ZSH est maintenant le terminal par defaut')
            rstudioapi::writeRStudioPreference('posix_terminal_shell', 'zsh')
        }
    }, action = 'append')
    " >> /home/rstudio/.Rprofile
fi
