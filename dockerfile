# Base image
FROM ubuntu:latest

# Install essential packages
RUN apt-get update && \
    apt-get install -y \
    curl \
    zsh \
    tmux \
    fontconfig \
    git \
    build-essential \
    nasm \
    neovim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set default shell to zsh
RUN chsh -s /bin/zsh

# Install the nerd font
RUN mkdir -p /usr/local/share/fonts
COPY ./fonts/*.ttf /usr/local/share/fonts/
RUN fc-cache -fv

# Copy dotfiles
COPY ./dotfiles/.tmux.conf /root/.tmux.conf
COPY ./dotfiles/nvim /root/.config/nvim

# Set the working dir at start
WORKDIR /workspace

# Default command to start with
CMD ["zsh"]

