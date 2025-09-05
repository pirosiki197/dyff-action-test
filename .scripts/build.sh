#!/bin/bash

set -euo pipefail

mkdir -p .built

for directory in overlay/*; do
    echo "Building $directory..."
    mkdir -p .built/built
    kustomize build "$directory" > .built/$(echo "$directory").yaml
done
