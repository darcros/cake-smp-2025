#!/bin/sh
set -euo pipefail

# Build the server 
(cd /template; mcman build --output /server)

# Last touches:
# crete Ledger directory because it won't create it on its own
mkdir -p /server/databases/ledger

# Start the server
_term() {  
  kill -TERM "$child_pid" 2>/dev/null
}
trap _term SIGTERM

(cd /server; ./start.sh) &

child_pid=$!
wait "$child_pid"
