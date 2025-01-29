# Base image
FROM ubuntu:24.04

# Install packages
RUN <<EOF
apt update
apt install -y \
    curl \
    default-jre \
    locales \
    neofetch \
    neovim \
    rlwrap \
    zsh \
EOF

# Setting up locale and encoding
RUN locale-gen en_US.UTF-8 && update-locale
ENV LANG=en_US.UTF-8

# TODO: Configuring NeoVim

# Install Clojure
RUN curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh && chmod +x linux-install.sh && ./linux-install.sh
# Install Leiningen
RUN curl -L -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein && chmod a+x lein && mv lein /usr/local/bin/lein && lein

# Install and configurate Zsh, Starship Prompt
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes
RUN echo "eval \"\$(starship init zsh)\"" >> ~/.zshrc
RUN echo "bindkey -v" >> ~/.zshrc
# Select shell
RUN chsh -s ~/.zshrc
CMD ["zsh"]

WORKDIR /home/ubuntu
