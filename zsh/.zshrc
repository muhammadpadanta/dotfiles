# ░▀▀█░▀█▀░█▀█░▀█▀░▀█▀
# ░▄▀░░░█░░█░█░░█░░░█░
# ░▀▀▀░▀▀▀░▀░▀░▀▀▀░░▀░

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
#zinit snippet OMZP::git
#zinit snippet OMZP::sudo
#zinit snippet OMZP::archlinux
#zinit snippet OMZP::aws
#zinit snippet OMZP::kubectl
#zinit snippet OMZP::kubectx
#zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q


# ░█░█░█▀▀░█░█░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀░█▀▀
# ░█▀▄░█▀▀░░█░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█░▀▀█
# ░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region


# ░█░█░▀█▀░█▀▀░▀█▀░█▀█░█▀▄░█░█
# ░█▀█░░█░░▀▀█░░█░░█░█░█▀▄░░█░
# ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░░▀░

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# ░█▀▀░█▀█░█▄█░█▀█░█░░░█▀▀░▀█▀░▀█▀░█▀█░█▀█░░░█▀▀░▀█▀░█░█░█░░░▀█▀░█▀█░█▀▀
# ░█░░░█░█░█░█░█▀▀░█░░░█▀▀░░█░░░█░░█░█░█░█░░░▀▀█░░█░░░█░░█░░░░█░░█░█░█░█
# ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░░░▀▀▀░░▀░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# ░█▀▀░█░█░█▀█░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░█▀▀░█░█░█░█░█░░░░█░░░█░░█░█░█░█░▀▀█
# ░▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

# Zsh function to cd to parent directory
function cd() {
    if [[ $# -eq 1 ]]; then
        case $1 in
            "...")
                builtin cd ../..
                ;;
            "....")
                builtin cd ../../..
                ;;
            ".....")
                builtin cd ../../../..
                ;;
            # Add more cases if needed
            *)
                builtin cd "$1"
                ;;
        esac
    else
        builtin cd "$@"
    fi
}

# Start tmux session "homezsh" using zsh shell if there's none, else attach to it
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
  if tmux has-session -t homezsh 2>/dev/null; then
    tmux attach-session -t homezsh
  else
    tmux new-session -s homezsh /usr/bin/zsh
  fi
fi

#Greetings message
function zsh_greeting() {
    neofetch
}
zsh_greeting


# ░█▀█░█▀█░▀█▀░█░█
# ░█▀▀░█▀█░░█░░█▀█
# ░▀░░░▀░▀░░▀░░▀░▀

export PATH=$PATH:/opt/flutter/bin
export ANDROID_HOME=/home/muhammadpadanta/Android/Sdk
export PATH=$PATH:/home/muhammadpadanta/Android/Sdk/platform-tools
export PATH=/opt/lampp/bin:$PATH
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:~/.local/bin
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=$HOME/.asdf/shims:$PATH
export PATH=$HOME/.local/share/nvim/mason/bin:$PATH
export PATH=/home/muhammadpadanta/.local/share/nvim/mason/packages/python-lsp-server/venv/bin:$PATH
export SPRING_HOME=/usr/local/spring-cli
export PATH=$SPRING_HOME/bin:$PATH
export JDTLS_JVM_ARGS="-javaagent:/home/muhammadpadanta/java-libs/lombok.jar"
export EDITOR=code


# ░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
# ░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀

# General aliases
alias stopxampp='sudo /opt/lampp/xampp stop'
alias startxampp='sudo /opt/lampp/xampp start'
alias mysqlxampp='sudo /opt/lampp/bin/mysql -u root -p'
alias obs='flatpak run com.obsproject.Studio'
alias cfish='nvim ~/.config/fish/config.fish'
alias pfish='nvim ~/.config/fish/functions/fish_prompt.fish'
alias czsh='nvim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias cbash='nvim ~/.bashrc'
alias cmux='nvim .tmux.conf'
alias smux='tmux source ~/.tmux.conf'
alias cala='nvim ~/.config/alacritty/alacritty.toml'
alias ckitty='nvim ~/.config/kitty/kitty.conf'
alias cnv='nvim ~/.config/nvim/'
alias cstar='nvim ~/.config/starship.toml'
alias tks='tmux kill-server'
alias chrome='google-chrome --new-tab 2>/dev/null'
alias firefox='firefox --new-tab 2>/dev/null'
alias brave='brave-browser --new-tab 2>/dev/null'
alias cx='chmod +x'
alias icat='kitten icat' 

# Disk usage aliases
alias dsize='du -sh'
alias dsize-all='du -sh * | sort -rh'

# exa aliases
alias ls='exa -F --icons'
alias ll='exa -l --icons'
alias la='exa -a -F --icons'
alias lt='exa -T --icons'
alias lta='exa -T -a -L4 --ignore-glob=.git --icons'
alias cl='clear'


# ░█▀▀░█░█░█▀▀░█░░░█░░░░░▀█▀░█▀█░▀█▀░█▀▀░█▀▀░█▀▄░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░▀▀█░█▀█░█▀▀░█░░░█░░░░░░█░░█░█░░█░░█▀▀░█░█░█▀▄░█▀█░░█░░░█░░█░█░█░█░▀▀█
# ░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd zx zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"




PATH=~/.console-ninja/.bin:$PATH