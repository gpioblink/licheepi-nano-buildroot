#!/usr/bin/env bash -xe

# if the directory is empty, init sdk
if [! -d ${DOCKER_WORKDIR}/licheepi-nano ]; then
	./build-sdk.sh
	cp -r ${BUILDROOT_OVERRIDES_DIR}/* ${DOCKER_WORKDIR}/buildroot
fi

cd ${DOCKER_WORKDIR}/buildroot
make toolchian

make linux-source
make uboot-source

