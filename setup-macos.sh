#!/bin/zsh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshenv

brew update
brew install \
    git starship nodenv pyenv rustup-init
brew install --cask \
    docker google-chrome arc iterm2

# font install
brew install --cask font-hack-nerd-font

# zsh-completions
cat << 'END' >> ~/.zshenv
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

rm -f ~/.zcompdump; compinit

END

# nodenv
echo 'export PATH=$HOME/.nodenv/bin:$PATH' >> ~/.zshenv
echo 'eval "$(nodenv init -)"' >> ~/.zshenv
nodenv install 20.10.0
nodenv global "$_"

# pyenv
echo 'eval "$(pyenv init --path)"' >> ~/.zshenv
pyenv install 3.12.1
pyenv global "$_"

# Xcode (15.2)
# mas install 497799835
# sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
# sudo xcodebuild -runFirstLaunch

chmod 755 /opt/homebrew/share

# setting .zshrc
cat << 'END' >> ~/.zshrc
# command
alias ls='ls --color=auto'
alias ll='ls -alps'

# git
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias gl='git log'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gf='git fetch'
alias gpl='git pull'
alias gr='git rebase'

# docker
alias dcu='docker compose up'

END
