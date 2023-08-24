#!/bin/bash

# Create an install script to install all packages
# another cool way to do this would be to build a Docker container for use on different OS
# but for this case I will make this script assuming ubuntu is installed

# 1. Update and install tools
sudo apt update && sudo apt install -y git zsh tmux neovim curl npm python3-pip ranger clang bear
sudo snap install ccls --classic

# 2. Config file placement: symlink neovim, tmux, zshrc, zsh_aliases, other in correct config directory
mkdir -p ~/.config/nvim
ln -s $(pwd)/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s $(pwd)/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/zsh/zsh_aliases ~/.zsh_aliases
mkdir -p ~/.config/tmux
ln -s $(pwd)/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
if [ ! -d $HOME/.config/shared/z.sh ]; then
  mkdir -p ~/.config/shared
  cp $(pwd)/z.sh ~/.config/shared/
fi
ln -s $(pwd)/flake8 ~/.config/flake8

# 3. NVIM setup: Install nodejs latest stable and nvim plugins
sudo npm install n -g
sudo n stable
sudo npm install --global pure-prompt
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall --sync' +qa
nvim +'CocInstall coc-jedi' +qa

# 4. Install pip packages
pip install pygments ipython scipy numpy pandas flake8 jedi-language-server

# 5. ZSH setup: place ohmyzsh with plugins (autosuggestions, highlighting, and theme)
if [ -z $ZSH ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
ZSH_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
if [ ! -d $ZSH_PLUGINS/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS/zsh-autosuggestions
fi
if [ ! -d $ZSH_PLUGINS/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS/zsh-syntax-highlighting
fi
sudo chsh -s `which zsh`
