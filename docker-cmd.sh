#!/bin/bash
set -eo pipefail

service awslogs start
service ntp start

python /docverter/app/src/main.py
