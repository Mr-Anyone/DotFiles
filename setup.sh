echo "Removing Directories"
# remove directory
rm -r ~/.config/i3
rm -r ~/.config/nvim
rm -r ~/.config/alacritty
rm -r ~/.tmux.conf
rm -r ~/.lldbinit
rm -r ~/.gitconfig

echo "Creating Symbolic Link"
# copy the neovim config file
sudo ln -s $(pwd)/nvim ~/.config/nvim
sudo ln -s $(pwd)/i3 ~/.config/i3
sudo ln -s $(pwd)/.tmux.conf ~/.tmux.conf
sudo ln -s $(pwd)/alacritty ~/.config/alacritty
sudo ln -s $(pwd)/.gitconfig ~/.gitconfig
sudo ln -s $(pwd)/.lldbinit ~/.lldbinit

echo "Setting up git"
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
