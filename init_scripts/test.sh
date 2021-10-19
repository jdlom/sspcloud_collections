#!/usr/bin/env bash

echo "execution of $@"
# check variable 


THE_USER=$(echo $KUBERNETES_SERVICE_ACCOUNT | cut -d '-' -f 1) 
declare -A USERS
USERS=(
  ["rstudio"]="rstudio" 
  ["ubuntu"]="headless" 
  ["cloushell"]="root")
THE_USER=${USERS[$THE_USER]}
echo $THE_USER

runuser -l $THE_USER -c 'sh -c \
"$(curl -fsSL https://raw.github.com/jdlom/sspcloud_collection/dev/init_script/01_installation_zsh.sh)"'