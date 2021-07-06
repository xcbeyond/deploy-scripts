#!/bin/sh

# install,init by config.json
cd /yapi/vendors
npm run install-server
# starting
node server/app.js

exit 0