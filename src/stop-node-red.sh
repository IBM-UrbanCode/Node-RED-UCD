#/**
# * © Copyright IBM Corporation 2014.  
# * This is licensed under the following license.
# * The Eclipse Public 1.0 License (http://www.eclipse.org/legal/epl-v10.html)
# * U.S. Government Users Restricted Rights:  Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp. 
# */

#!/bin/bash

echo ===============================================================
echo "Checking for NodeRED installation...."
echo ===============================================================
echo

if [[ ! -d "$1/node-red" ]]; then
    echo >&2 "NodeRED install does not exist in directory $1..."
    exit 1
fi

echo
echo ===============================================================
echo starting NodeRED 
echo ===============================================================
echo

echo "Changing to NodeRED install directory"
cd $1
cd node-red

echo "Checking if NodeRED is running (i.e. .node-red.pid file exists)"
if [ ! -f ".node-red.pid" ]; then
    echo "NodeRED is not running."
    exit 0
fi

echo "Stopping NodeRED"
kill $(cat .node-red.pid)
echo "Removing PID file"
rm -f .node-red.pid

exit 0
