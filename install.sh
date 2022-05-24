# Create an install script to install all packages
# another cool way to do this would be to build a Docker container for use on different OS
# but for this case I will make this script assuming ubuntu is installed

# 1. install ohmyzsh and setup with plugins (autosuggestions, highlighting, and theme)
sudo apt install zsh

# 2. install neovim and tmux

# 3. place neovim, tmux, zshrc, zsh_aliases in correct directory
#    don't forget to tell tmux where it's config file is located
sudo apt install tmux neovim
tmux source-file ~/.config/tmux/tmux.conf

# 4. install npm, nodejs, and ccls and plugins in nvim/init.vim
