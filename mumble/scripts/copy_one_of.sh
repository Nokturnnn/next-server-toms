#!/bin/bash
set -e

# Ensure the source files exist and copy the first one that does
for src in "$@"; do
  if [ -f "$src" ]; then
    cp "$src" /mumble/repo/default_config.ini
    exit 0
  fi
done

# If none of the files exist, exit with an error
echo "None of the specified files exist"
exit 1
