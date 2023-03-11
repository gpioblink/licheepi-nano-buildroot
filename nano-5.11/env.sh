#/bin/sh -xe

DOCKER_WORKDIR="/opt/nanowork"

RELEASE_NAME=${PWD##*/}

BUILDROOT_DIR="${DOCKER_WORKDIR}/${RELEASE_NAME}-build"

SDK_TARBALL_PATH="/root/buildroot/output/images/arm-buildroot-linux-gnueabi_sdk-buildroot.tar.gz"

BUILDROOT_OVERRIDES_DIR="./overrides"

