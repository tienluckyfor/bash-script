#!/bin/bash

#bash test/auto-fill.sh <<<$(printf "y\n2\n1\nn\nn\n")
# . .env
. "${BASH_SOURCE%/*}/../.env"

echo $USER
echo $P_MAIL

# read site
# echo $site