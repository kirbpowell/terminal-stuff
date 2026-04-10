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
. /LOCATION/OF/Z/SCRIPT/z.sh

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

##########################
#  CONTAINER             #
#              STUFF     #
##########################

# Get rid of hanging docker containers
dockerkill() {
    docker rm $(docker ps -a -q) -f
}

# Get rid of old docker images
dockerclean() {
    docker rmi $(docker images -a --filter=dangling=true -q)
}
