#!/bin/bash

set -euo pipefail

mkdir -p .built/overlay
for directory in overlay/*; do
    echo "Building $directory..."
    kustomize build "$directory" > .built/$(echo "$directory").yaml
done
