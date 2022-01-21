#!/bin/sh

cd /yapi/vendors

if [ $1 == "start" ]; then
   echo "starting..."
   npm run start
elif [ $1 == "install" ]; then
   echo "install..."
   npm run install-server
   echo "starting..."
   npm run start
else
   echo "unkonwn args: " $1
fi

exit 0