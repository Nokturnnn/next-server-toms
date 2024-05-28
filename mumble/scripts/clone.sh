#!/bin/bash
set -e

# Clone the Mumble repository
git clone https://github.com/mumble-voip/mumble.git --branch $MUMBLE_VERSION --single-branch /mumble/repo
