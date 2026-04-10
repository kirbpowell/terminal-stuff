# General aliases for useful stuff

# Way better git log --found on coderwall.com
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# use NeoViM instead of ViM
alias vim="/opt/homebrew/bin/nvim"
alias vi="/opt/homebrew/bin/nvim"

# Better ll command
alias ll="ls -la"

# vundle update alias
alias vimupdate="vim +PluginInstall +qall"

alias bg="batgrep"

alias gdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff"
