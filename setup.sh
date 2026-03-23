
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
ln -s $(pwd)/nvim ~/.config/nvim
ln -s $(pwd)/i3 ~/.config/i3
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/alacritty ~/.config/alacritty
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.lldbinit ~/.lldbinit
