#/**
# * © Copyright IBM Corporation 2014.  
# * This is licensed under the following license.
# * The Eclipse Public 1.0 License (http://www.eclipse.org/legal/epl-v10.html)
# * U.S. Government Users Restricted Rights:  Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp. 
# */

#!/bin/bash

echo
echo ===============================================================
echo Running uninstall of  NodeRED 
echo ===============================================================
echo

if [[ -z "$@" ]]; then
    echo >&2 "You must supply an argument!"
    exit 9
elif [[ ! -d "$1" ]]; then
    echo >&2 "Passed Node base install directory $1 is does not exist!"
    exit 9
fi

echo "Changing to install directory"
cd $1

echo "Checking that node-red directory exist"
if [[ -d node-red ]]; then
    echo "node-red directory exists so deleting it..."
    rm -rf node-red
else
    echo "node-red installation not found at specified location!"
    exit 9
fi

exit 0
