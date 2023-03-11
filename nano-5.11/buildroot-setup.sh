#!/bin/bash -xe

source ./env.sh

# if the directory is empty, init sdk
if [ ! -d ${DOCKER_WORKDIR}/licheepi-nano-sdk ]; then
	bash -xe build-sdk.sh
	cp -r ${BUILDROOT_OVERRIDES_DIR}/* ${DOCKER_WORKDIR}/buildroot
fi

cd ${DOCKER_WORKDIR}/buildroot
make toolchain

make linux-source
make uboot-source

