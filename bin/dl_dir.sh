# Pass:
#   $1: the filetype to download
#   $2: a URL of a HTTP directory (ie: index of _____)

wget -r -np -nH --cut-dirs=3 -A $1 $2