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
