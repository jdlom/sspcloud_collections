#!/usr/bin/env bash

echo "execution of $@"

THE_USER=$(echo $KUBERNETES_SERVICE_ACCOUNT | cut -d '-' -f 1)
declare -A USERS
USERS=(
  ["rstudio"]="rstudio" 
  ["ubuntu"]="headless" 
  ["cloushell"]="root")

THE_USER=${USERS[$THE_USER]:-root}

echo user detected is $THE_USER

REPO='sspcloud_collections'
BRANCH='dev'
git clone https://github.com/jdlom/$REPO/ /tmp/$REPO/
cd /tmp/$REPO/
git checkout $BRANCH

INIT_FOLDER='init_scripts'
for f in $(ls -I init_script.sh $FOLDER); do
bash "$INIT_FOLDER/$f"
done
