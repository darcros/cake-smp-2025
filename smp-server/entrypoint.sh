#!/bin/sh
set -euo pipefail

### build the server ###
cd /template && mcman build --output /server

### prepare the server ###

# Needed because Ledger won't create the directory itself
mkdir -p /server/databases/ledger

### start the server ###
cd /server && ./start.sh
