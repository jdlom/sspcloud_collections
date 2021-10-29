#!/usr/bin/env bash

# fork repo from MTES-MCT
runuser -l $THE_USER -c "gh repo list MTES-MCT -L 3000 |
    grep -e parcours_r -e savoirfr |
    awk '{print $1}' |
    xargs -n1 -I _repository gh repo fork _repository --clone --remote"

# sync already forked repo
REPO=$(runuser -l $THE_USER -c "gh repo list -L 3000 |
    grep -e parcours_r -e savoirfr |
    awk '{print $1}'")

# main or main branch
runuser -l $THE_USER -c "echo -n $REPO | xargs -t -d ' ' -I _repo gh repo sync _repo"
# dev branch
runuser -l $THE_USER -c "echo -n $REPO | xargs -t -d ' ' -I _repo gh repo sync --branch dev _repo"