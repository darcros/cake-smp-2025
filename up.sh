#/bin/bash
set -euo pipefail

USER=1000
GROUP=1000

mkdir -p ./data/smp/; podman unshare chown $USER:$GROUP ./data/smp
mkdir -p ./data/smp-backup/backups; podman unshare chown $USER:$GROUP ./data/smp-backup/backups

podman compose up --build
