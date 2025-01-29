# Base image
FROM ubuntu:24.04

# Install packages
RUN <<EOF
apt update
apt install -y \
    locales \
    curl \
    neofetch \
    neovim \
    zsh \
EOF

# Setting up locale and encoding
RUN locale-gen en_US.UTF-8 && update-locale
ENV LANG=en_US.UTF-8

# Install and configurate zsh, starship prompt
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes
RUN echo "eval \"\$(starship init zsh)\"" >> ~/.zshrc

# Select shell
RUN chsh -s ~/.zshrc
CMD ["zsh"]

# RUN zsh -c eval "$(starship init zsh)"
