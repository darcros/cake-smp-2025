#/bin/bash
set -euo pipefail

USER=1000
GROUP=1000

mkdir -p ./data/smp/universe; chown $USER:$GROUP ./data/smp/universe
mkdir -p ./data/smp/databases; chown $USER:$GROUP ./data/smp/databases
mkdir -p ./data/smp/logs; chown $USER:$GROUP ./data/smp/logs

mkdir -p ./data/smp-backup/backups; chown $USER:$GROUP ./data/smp-backup/backups

docker compose up --build
