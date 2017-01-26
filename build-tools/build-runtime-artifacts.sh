#!/bin/bash

# This script builds and uses a docker container to produce official artifacts

set -e
set -x

CURDIR="$(dirname $BASH_SOURCE)"

. $CURDIR/build-env.sh

# Build the builder image.
$CURDIR/build-devel-image.sh

# Build artifacts using the build image
$CURDIR/run-in-docker.sh make release

if $CLEAN_BUILD; then
  docker rmi $BUILD_IMG_TAG
fi

# Now ready to run ./build-runtime-images.sh
