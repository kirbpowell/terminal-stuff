# Scripts & Functions that don't fit elsewhere

# General CLI stuff
export CLICOLOR=1
export LC_TYPE="en_US.UTF-8"

# Python-json Formatter
ppjson() {
    cat "$1" | python3 -m json.tool
}

# Use ViM for man pages
vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manpages entry for $*"
    fi
}

# The "Z" command!
. /usr/local/etc/profile.d/z.sh

# Terminal color-test script
ctest() {
    awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
        s="/\\";
        for (colnum = 0; colnum<term_cols; column++) {
            r = 255-(colnum*255/term_cols);
            g = (colnum*510/term_cols);
            b = (colnum*255/term_cols);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum%2+1,1);
        }
        printf "\n";
    }'
}

# enable the vman command!
vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No man entry for $*"
    fi
}

##########################
#  CONTAINER             #
#              STUFF     #
##########################

# Making exec-ing into kube pods faster
kbash() {
    kubectl exec -it $1 bash
}

# Shortcut for getting CrashLoop logs
kcrashlogs() {
    kubectl logs -f $(kubectl get pods -oname | awk "/$1/")
}

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

# Exec into pod. Usage: kb descriptor
kb() {
  POD=$(kubectl get pods | grep "$1" | head -1 | cut -d' ' -f1)
  echo -e "\033[0;35mEntering pod bash ${POD}\033[0m"
  kubectl exec -it $POD bash
}

# Get rid of hanging docker containers
dockerkill() {
    docker rm $(docker ps -a -q) -f
}

# Get rid of old docker images
dockerclean() {
    docker rmi $(docker images -a --filter=dangling=true -q)
}
