# install github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

#configure git
env | grep "URL_GIT" | cut -d "=" -f2 > /home/$THE_USER/git.store
chown $THE_USER /home/$THE_USER/git.store
chmod o-r,g-r /home/$THE_USER/git.store
runuser -l $THE_USER -c 'git config --global credential.helper "store --file ~/git.store"'

#authenticate
#need GH_TOKEN
runuser -l $THE_USER -c 'gh auth login'