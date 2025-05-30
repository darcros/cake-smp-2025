#!/bin/sh
set -euo pipefail

# Build the server 
(cd /template; mcman build --output /server)

# Last touches:
# crete Ledger directory because it won't create it on its own
mkdir -p /server/databases/ledger

# Start the server 
(cd /server; ./start.sh)
