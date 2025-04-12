#!/bin/sh
set -euo pipefail

error() {
  echo "$@" 1>&2
}

fail() {
  error "$@"
  exit 1
}

SERVER_VERSION=$(cat ./SERVER_VERSION.txt)
SERVER_JARS=$(find . -maxdepth 1 -name fabric-server-${SERVER_VERSION}-\*.jar -type f)

case $(echo "${SERVER_JARS}" | wc --words) in
  0)
    fail "Server jar not found. Please make sure the server jar is in the current directory."
    exit 1
    ;;
  1)
    echo "${SERVER_JARS}"
    ;;
  *)
    fail "Multiple server jars found. Please make sure only one server jar is in the current directory."
    exit 1
    ;;
esac
