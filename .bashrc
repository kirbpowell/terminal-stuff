 if [ -d $HOME/.shellrc/bashrc.d ]; then
      for file in $HOME/.shellrc/bashrc.d/*.bash; do
        [ -e "$file" ] || break
        source $file
      done
    fi

 export LC_TYPE="en_US.UTF-8"

 vman() {
     vim -c "SuperMan $*"

     if [ "$?" != "0" ]; then
         echo "No man entry for $*"
     fi
 }
