#!/bin/bash

set -euo pipefail

mkdir -p .built/overlay
for directory in overlay/*; do
    echo "Building $directory..."
    kustomize build "$directory" --load-restrictor LoadRestrictionsNone --enable-helm \
        | yq ".metadata.namespace = (.metadata.namespace // \"$directory\")" \
        > .built/$(echo "$directory").yaml
done
