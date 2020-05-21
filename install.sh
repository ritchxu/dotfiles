git config --global user.name "ritchxu"
git config --global user.email "ritchxu@github.com"
git config --global pager.branch false
git config --global push.default current

ln -s ~/.dotfiles/.zshrc ~/

# zsh 
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    sudo apt install -y zsh
    zsh
fi;
