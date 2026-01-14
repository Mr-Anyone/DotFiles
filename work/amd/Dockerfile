FROM rocm/mlir:latest

WORKDIR /tmp
# Download Neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz  && \
    tar -xf  nvim-linux-x86_64.tar.gz && \
    cp -r /tmp/nvim-linux-x86_64/* /usr/local/
# Download fzf
RUN wget https://github.com/junegunn/fzf/releases/download/v0.67.0/fzf-0.67.0-linux_amd64.tar.gz  &&  \
    tar -xf fzf-0.67.0-linux_amd64.tar.gz && \
    cp fzf /usr/local/bin
# Download useful ripgrep
RUN apt update -y && apt install ripgrep tmux clangd -y
# Install lazygit
RUN wget https://github.com/jesseduffield/lazygit/releases/download/v0.58.1/lazygit_0.58.1_linux_x86_64.tar.gz && \ 
    tar -xf lazygit_0.58.1_linux_x86_64.tar.gz && \ 
    cp lazygit /usr/local/bin
