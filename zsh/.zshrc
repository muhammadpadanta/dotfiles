# Load Homebrew's shell environment
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# Add zsh-completions to fpath
fpath=($(brew --prefix)/share/zsh-completions $fpath)

# Ensure the default zsh functions directory is included
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# Enable completions
autoload -Uz compinit
compinit

# Path #
# General path
export PATH=$PATH:/opt/flutter/bin
export PATH=$PATH:/home/muhammadpadanta/Android/Sdk/platform-tools
export PATH=/opt/lampp/bin:$PATH
export PATH=$PATH:/opt/lampp/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
# export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.local/bin
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=$HOME/.asdf/shims:$PATH
export PATH=$HOME/.local/share/nvim/mason/bin:$PATH
export PATH=/home/muhammadpadanta/.local/share/nvim/mason/packages/python-lsp-server/venv/bin:$PATH
export SPRING_HOME=/usr/local/spring-cli
export PATH=$SPRING_HOME/bin:$PATH

# Specific path
# export JAVA_HOME=/usr/lib/jvm/jdk-22-oracle-x64
# export JAVA_HOME=$(asdf which java | xargs dirname)
export JDTLS_JVM_ARGS="-javaagent:/home/muhammadpadanta/dev/lombok.jar"
# export GOPATH=$HOME/project/go
export PATH=/home/muhammadpadanta/.asdf/bin:$PATH
export ASDF_DIR=/home/muhammadpadanta/.asdf

# Aliases #
# General aliases
alias stopxampp='sudo /opt/lampp/xampp stop'
alias startxampp='sudo /opt/lampp/xampp start'
alias mysqlxampp='sudo /opt/lampp/bin/mysql -u root -p'
alias obs='flatpak run com.obsproject.Studio'
alias ll='exa -la --icons'
alias cfish='nvim ~/.config/fish/config.fish'
alias sfish='source ~/.config/fish/config.fish'
alias pfish='nvim ~/.config/fish/functions/fish_prompt.fish'
alias cmux='nvim .tmux.conf'
alias smux='tmux source ~/.tmux.conf'
alias ckitty='nvim ~/.config/kitty/kitty.conf'
alias cnv='nvim ~/.config/nvim/'
alias cstar='nvim ~/.config/starship.toml'
alias tks='tmux kill-server'

# exa aliases
alias ls='exa -F --icons'
alias ll='exa -l --icons'
alias la='exa -a -F --icons'
alias lt='exa -T --icons'

# Functions #
# Zsh function to cd to parent directory

# Initialize #
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/.asdf/asdf.sh
eval "$(~/.local/bin/mise activate zsh)"
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# export PYENV_ROOT=$HOME/.pyenv
# export PATH=$PYENV_ROOT/bin:$PATH
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

#d
