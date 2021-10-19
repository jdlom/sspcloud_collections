#!/usr/bin/env bash

echo "execution of $@"

#dirty method to find the user
THE_USER=$(find /home -name "lost+found" | cut -d "/" -f3)
export THE_USER=${THE_USER:-root}

echo user detected is $THE_USER

REPO='sspcloud_collections'
BRANCH='main'
git clone https://github.com/jdlom/$REPO/ /tmp/$REPO/
cd /tmp/$REPO/
git checkout $BRANCH

INIT_FOLDER='init_scripts'
for f in $(ls -I init_script.sh $INIT_FOLDER); do
bash "$INIT_FOLDER/$f"
done
