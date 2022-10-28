#!/bin/bash

set -e

USERNAME="$1"
TOKEN="$2"

ORGANIZATION="$3"
REPOSITORY="$4"
BRANCH="$5"

RUN_CMD="$6"

# Store credentials for 60 minutes so that it does not asks for submodules
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

git clone --single-branch --branch ${BRANCH} "https://${USERNAME}:${TOKEN}@github.com/${ORGANIZATION}/${REPOSITORY}.git"

pushd ${REPOSITORY}

git submodule update --init --recursive

if eval ${RUN_CMD}; then
    echo "Command succeeded!"
else
    echo "Command ${RUN_CMD} failed with exit code: $?"
    exit 1
fi

popd