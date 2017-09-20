#!/bin/bash
set -eo pipefail

service ntp start

python /docverter/app/src/main.py
