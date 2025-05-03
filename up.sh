#/bin/bash
set -euo pipefail

USER=1000
GROUP=1000

# ensure all mounted directories exist and are owned by the correct user
mkdir -p "./data/smp/server/"
mkdir -p "./data/smp/server/squaremap/web"
mkdir -p "./data/smp-backup/backups"
podman unshare chown -R "$USER:$GROUP" "./data"

podman compose up --build
