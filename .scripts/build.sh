#!/bin/bash

set -euo pipefail

mkdir -p .built/built
ls -l overlay
for directory in overlay/*; do
    echo "Building $directory..."
    kustomize build "$directory" > .built/$(echo "$directory").yaml
done
