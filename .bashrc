 if [ -d $HOME/.shellrc/bashrc.d ]; then
      for file in $HOME/.shellrc/bashrc.d/*.bash; do
        [ -e "$file" ] || break
        source $file
      done
    fi

