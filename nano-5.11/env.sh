#/bin/bash -xe

DOCKER_IMAGE_TAG="nano-5.11"

DOCKER_WORKDIR="/opt/nanowork"

RELEASE_NAME="nano-5.11"

BUILDROOT_DIR="${DOCKER_WORKDIR}/${RELEASE_NAME}-build"

SDK_TARBALL_PATH="/root/buildroot/output/images/arm-buildroot-linux-gnueabi_sdk-buildroot.tar.gz"

BUILDROOT_OVERRIDES_DIR="./overrides"

