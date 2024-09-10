rm -r ~/.config/i3
rm -r ~/.config/nvim

# copy the neovim config file
sudo ln -s $(pwd)/nvim ~/.config/nvim
sudo ln -s $(pwd)/i3 ~/.config/i3
