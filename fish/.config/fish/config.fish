# Greeting message
set -u fish_greeting ""


# Start tmux session home if theres none, else attach to it
if status is-interactive
    and not set -q TMUX
        if tmux has-session -t home 2>/dev/null
            exec tmux attach-session -t home
        else
            tmux new-session -s home
        end
end


# Path #
# General path
set -x PATH $PATH /opt/flutter/bin
set -x PATH $PATH /home/muhammadpadanta/Android/Sdk/platform-tools
set -x PATH /opt/lampp/bin $PATH
set -x PATH $PATH /opt/lampp/bin
set -x PATH $PATH $HOME/.config/composer/vendor/bin
# set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH ~/.local/bin
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -gx PATH $HOME/.asdf/shims $PATH
set -gx PATH $HOME/.local/share/nvim/mason/bin $PATH
set -gx PATH /home/muhammadpadanta/.local/share/nvim/mason/packages/python-lsp-server/venv/bin $PATH
set -x SPRING_HOME /usr/local/spring-cli
set -x PATH $SPRING_HOME/bin $PATH
set -gx JDTLS_JVM_ARGS "-javaagent:/home/muhammadpadanta/java-libs/lombok.jar"


# Aliases #
# general aliases
alias stopxampp 'sudo /opt/lampp/xampp stop'
alias startxampp 'sudo /opt/lampp/xampp start'
alias mysqlxampp 'sudo /opt/lampp/bin/mysql -u root -p'
alias obs 'flatpak run com.obsproject.Studio'
alias ll 'ls -la'
alias cfish 'nvim ~/.config/fish/config.fish'
alias sfish 'source ~/.config/fish/config.fish'
alias pfish 'nvim ~/.config/fish/functions/fish_prompt.fish'
alias cmux 'nvim .tmux.conf'
alias smux 'tmux source ~/.tmux.conf'
alias ckitty 'nvim ~/.config/kitty/kitty.conf'
alias cnv 'nvim ~/.config/nvim/'
alias cstar 'nvim ~/.config/starship.toml'
alias tks 'tmux kill-server'

# exa aliases
alias ls='exa -F --icons'
alias ll='exa -l --icons'
alias la='exa -a -F --icons'
alias lt='exa -T --icons'
alias lta='exa -T -a --icons'


# Configuration #


# Function # 
# fish function to cd to parent directory
function cd
    switch (count $argv)
        case 1
            switch $argv[1]
                case "..."
                    builtin cd ../..
                case "...."
                    builtin cd ../../..
                case "....."
                    builtin cd ../../../..
                # Add more cases if needed
                case "*"
                    builtin cd $argv
            end
        case "*"
            builtin cd $argv
    end
end

if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# Initialize #
starship init fish | source
zoxide init fish | source
~/.local/bin/mise activate fish | source

# set -Ux PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# pyenv init - | source




