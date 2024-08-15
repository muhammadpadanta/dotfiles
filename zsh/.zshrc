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


# .·:''''''''''''''''''''''''':·.
# : :  ____   _  _____ _   _  : :
# : : |  _ \ / \|_   _| | | | : :
# : : | |_) / _ \ | | | |_| | : :
# : : |  __/ ___ \| | |  _  | : :
# : : |_| /_/   \_\_| |_| |_| : :
# '·:.........................:·'
# General path
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


# .·:''''''''''''''''''''''''''''''''''''''''''''''':·.
# : :     _    _     ___    _    ____  _____ ____   : :
# : :    / \  | |   |_ _|  / \  / ___|| ____/ ___|  : :
# : :   / _ \ | |    | |  / _ \ \___ \|  _| \___ \  : :
# : :  / ___ \| |___ | | / ___ \ ___) | |___ ___) | : :
# : : /_/   \_\_____|___/_/   \_\____/|_____|____/  : :
# '·:...............................................:·'
#General alias
alias stopxampp='sudo /opt/lampp/xampp stop'
alias startxampp='sudo /opt/lampp/xampp start'
alias mysqlxampp='sudo /opt/lampp/bin/mysql -u root -p'
alias obs='flatpak run com.obsproject.Studio'
alias cfish='nvim ~/.config/fish/config.fish'
alias pfish='nvim ~/.config/fish/functions/fish_prompt.fish'
alias cbash='nvim ~/.bashrc'
alias czsh='nvim ~/.zshrc'
alias szsh='source ~/.zshrc'
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


# du aliases
# Alias to check the size of a directory
alias dsize='du -sh'
# Alias to check the size of all directories and subdirectories in the current path
alias dsize-all='du -sh * | sort -rh'

# exa aliases
alias ls='exa -F --icons'
alias ll='exa -l --icons'
alias la='exa -a -F --icons'
alias lt='exa -T --icons'
alias lta='exa -T -a -L4 --ignore-glob=.git --icons'


# .·:'''''''''''''''''''''''''''''''''''''''''''''''':·.
# : :  _____ _   _ _   _  ____ _____ ___ ___  _   _  : :
# : : |  ___| | | | \ | |/ ___|_   _|_ _/ _ \| \ | | : :
# : : | |_  | | | |  \| | |     | |  | | | | |  \| | : :
# : : |  _| | |_| | |\  | |___  | |  | | |_| | |\  | : :
# : : |_|    \___/|_| \_|\____| |_| |___\___/|_| \_| : :
# '·:................................................:·'
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


# .·:'''''''''''''''''''''''''''''''''''''''''''''''''''''''':·.
# : :  ___ _   _ ___ _____ ___    _    _     ___ __________  : :
# : : |_ _| \ | |_ _|_   _|_ _|  / \  | |   |_ _|__  / ____| : :
# : :  | ||  \| || |  | |  | |  / _ \ | |    | |  / /|  _|   : :
# : :  | || |\  || |  | |  | | / ___ \| |___ | | / /_| |___  : :
# : : |___|_| \_|___| |_| |___/_/   \_\_____|___/____|_____| : :
# '·:........................................................:·'
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
eval "$(~/.local/bin/mise activate zsh)"
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Add zsh-completions to fpath
fpath=($(brew --prefix)/share/zsh-completions $fpath)

# Ensure the default zsh functions directory is included
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# Enable completions
autoload -Uz compinit
compinit
