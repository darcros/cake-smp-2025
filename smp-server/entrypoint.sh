#!/bin/sh
set -euo pipefail

# build the server
cd /template && mcman build --output /server

# Needed because Ledger won't create the directory itself
# TODO: re-enable
# mkdir -p ./databases/ledger

# start the server
cd /server && ./start.sh
