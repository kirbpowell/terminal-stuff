# Kirby's general scripts & functions

# use python to format .json
ppsjon() {
    cat $1 | python3 -m json.tool
}

# enable the vman command!
 vman() {
     vim -c "SuperMan $*"

     if [ "$?" != "0" ]; then
         echo "No man entry for $*"
     fi
 }

# Z!
. /usr/local/etc/profile.d/z.sh

export CLICOLOR=1
