git config --global user.name "ritchxu"
git config --global user.email "ritchxu@github.com"
git config --global pager.branch false
git config --global push.default current

echo "export AzureSubscriptionId=4ca6f0c2-8411-41ad-8382-81bd1cc491b3" >> ~/.profile

ln -s ~/.dotfiles/.zshrc ~/

# zsh 
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    sudo apt install -y zsh
    zsh
fi;
