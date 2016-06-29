#/**
# * © Copyright IBM Corporation 2014.  
# * This is licensed under the following license.
# * The Eclipse Public 1.0 License (http://www.eclipse.org/legal/epl-v10.html)
# * U.S. Government Users Restricted Rights:  Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp. 
# */

#!/bin/bash

echo ===============================================================
echo "Checking pre-reqs for NodeRED installation are installed...."
echo ===============================================================
echo
echo "Checking Node.js is installed...."

if which node >/dev/null 2>/dev/null; then
    echo " Node exists"
else
    echo "Node does not exist"
    exit 9
fi

echo "Checking npm is installed...."
if which npm >/dev/null 2>/dev/null; then
    echo " npm exists"
else
    echo "npm does not exist"
    exit 9
fi

echo "Checking git is installed...."
if which git >/dev/null 2>/dev/null; then
    echo " git exists"
else
    echo "git does not exist"
    exit 9
fi

echo
echo ===============================================================
echo All pre-reqs are installed so running NodeRED installation
echo ===============================================================
echo

if [[ -z "$@" ]]; then
    echo >&2 "You must supply an argument!"
    exit 1
elif [[ ! -d "$1" ]]; then
    echo >&2 "$1 is does not exist so creating directory..."
    mkdir $1
fi

echo "Changing to install directory"
cd $1

echo "Checking that node-red directory doesn't exist, if it does remove it"
if [[ -d node-red ]]; then
    echo "node-red directory exists so deleting it..."
    rm -rf node-red
fi


echo "Running git to download NodeRed Code"

git clone https://github.com/node-red/node-red.git

echo "Running npm install for NodeRed"
cd node-red
npm install --production

exit 0
