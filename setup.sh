rm -r ~/.config/i3
rm -r ~/.config/nvim
rm -r ~/.tmux.conf
rm -r ~/.gitconfig

# copy the neovim config file
sudo ln -s $(pwd)/nvim ~/.config/nvim
sudo ln -s $(pwd)/i3 ~/.config/i3
sudo ln -s $(pwd)/.tmux.conf ~/.tmux.conf
sudo ln -s $(pwd)/.gitconfig ~/.gitconfig

git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
