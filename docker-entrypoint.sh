#!/bin/bash
set -eo pipefail

service ntp start

echo "$@"
exec "$@"
