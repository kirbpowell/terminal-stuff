# General aliases for useful stuff

# Way better git log --found on coderwall.com
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# use NeoViM instead of ViM
alias vim="/usr/local/bin/nvim"
alias vi="/usr/local/bin/nvim"

# Better ll command
alias ll="ls -la"

# vundle update alias
alias vimupdate="vim +PluginInstall +qall"

# Alias get pods because I do it all the time
alias kgp="kubectl get pods"
