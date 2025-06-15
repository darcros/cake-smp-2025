#!/bin/bash
set -euo pipefail

podman compose --file compose.yml --file compose.prod.yml down --timeout 120
