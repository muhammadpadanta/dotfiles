# Greeting message
set -u fish_greeting ""

if status is-interactive
    and not set -q TMUX
        if tmux has-session -t home 2>/dev/null
            exec tmux attach-session -t home
        else
            tmux new-session -s home
        end
end

#ddd

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



# Specific path
# set -x JAVA_HOME /usr/lib/jvm/jdk-22-oracle-x64
# set -gx JAVA_HOME (asdf which java | xargs dirname)
set -gx JDTLS_JVM_ARGS "-javaagent:/home/muhammadpadanta/dev/lombok.jar"
# set -x GOPATH $HOME/project/go
set -gx PATH /home/muhammadpadanta/.asdf/bin $PATH
set -gx ASDF_DIR /home/muhammadpadanta/.asdf


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

# Initialize #
starship init fish | source
zoxide init fish | source
source ~/.asdf/asdf.fish
~/.local/bin/mise activate fish | source
# set -Ux PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# pyenv init - | source




