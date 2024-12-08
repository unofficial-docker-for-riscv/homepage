#!/bin/bash
# DO NOT UPSTREAM THIS FILE

VERSION=$(cat ./package.json | jq -r .version)

REPOS=(${REPOS:-ngc7331/riscv-homepage})
TAGS=()
for repo in ${REPOS[@]}; do
  TAGS+=("-t ${repo,,}:${VERSION}")
  TAGS+=("-t ${repo,,}:latest")
done

docker buildx build \
  ${TAGS[@]} \
  --push \
  --platform linux/riscv64 \
  -f Dockerfile .
