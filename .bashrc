# Kirby's .bashrc.

# source all of the cool stuff in my .shellrc folder
 if [ -d $HOME/.shellrc/bashrc.d ]; then
      for file in $HOME/.shellrc/bashrc.d/*.bash; do
        [ -e "$file" ] || break
        source $file
      done
    fi

 export LC_TYPE="en_US.UTF-8"

# enable the vman command!
 vman() {
     vim -c "SuperMan $*"

     if [ "$?" != "0" ]; then
         echo "No man entry for $*"
     fi
 }

# Alias get pods because I do it all the time
 alias kgp="kubectl get pods"

# Making exec-ing into kube pods faster
 kbash() {
     kubectl exec -it $1 bash
 }

# Shortcut for getting CrashLoop logs
kcrashlogs() {
    kubectl logs -f $(kubectl get pods -oname | awk "/$1/")
}

# Shortcut to the pretty git log described by coderwall.com
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Exec into a pod with the name <something>chart
kpod() {
  POD=$(kubectl get pods | grep "$1.*chart" | head -1 | cut -d' ' -f1)
  echo "Entering pod ${POD}"
  kubectl exec -it $POD bash
}

# Exec into a pod and run shell_plus immediately
ksp() {
  POD=$(kubectl get pods | grep "$1.*chart" | head -1 | cut -d' ' -f1)
  echo -e "\033[0;35mEntering pod ${POD}\033[0m"
  kubectl exec -it $POD python manage.py shell_plus
}

#alias vim="/Applications/MacVim.app/Contents/bin/mvim -v"

alias vimupdate="vim +PluginInstall +qall"
