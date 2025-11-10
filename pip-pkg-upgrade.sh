#!/bin/bash

python3 -m pip list --outdated --format=json | \
      jq -r '.[] | "\(.name)==\(.latest_version)"' | \
      xargs --no-run-if-empty -n1 pip3 install -U
