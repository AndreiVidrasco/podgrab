#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-}"
if [[ -z "$VERSION" ]]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 0.3.1"
  exit 1
fi

cd "$(dirname "$0")"

IMAGE="registry.vidrasco.com/podgrab"

docker buildx build \
  --platform linux/amd64 \
  --tag "${IMAGE}:${VERSION}" \
  --tag "${IMAGE}:latest" \
  --push \
  .
