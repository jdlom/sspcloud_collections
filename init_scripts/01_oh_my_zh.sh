#!/bin/bash

# install zh
sudo apt-get update
sudo apt install -y zsh

# install oh my zh
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh
