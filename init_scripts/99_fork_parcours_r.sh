#!/usr/bin/env bash

mkdir -p /home/$THE_USER/parcours-r && \
    cd /home/$THE_USER/parcours-r

#authenticate
gh auth login --with-token $GH_TOKEN

# fork repo from MTES-MCT
gh repo list MTES-MCT -L 3000 |
    grep -e parcours_r -e savoirfr |
    awk '{print $1}' |
    xargs -n1 -I _repository gh repo fork _repository --clone --remote

# sync already forked repo
REPO=`gh repo list -L 3000 |
    grep -e parcours_r -e savoirfr |
    awk '{print $1}'`

# main or main branch
echo -n $REPO | xargs -t -d ' ' -I _repo gh repo sync _repo
# dev branch
echo -n $REPO | xargs -t -d ' ' -I _repo gh repo sync --branch dev _repo

chown -R $THE_USER:$THE_USER /home/$THE_USER/parcours-r
