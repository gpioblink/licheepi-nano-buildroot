#!/bin/bash -xe

source ./env.sh

# if the directory is empty, init sdk
if [ ! -d ${DOCKER_WORKDIR}/licheepi-nano-sdk ]; then
	bash -xe build-sdk.sh
	cp -r ${BUILDROOT_OVERRIDES_DIR}/* ${DOCKER_WORKDIR}/buildroot
fi

if [ ! -d ${DOCKER_WORKDIR}/licheepi-nano ]; then
	mkdir -p ${DOCKER_WORKDIR}/licheepi-nano
	cp -r ${BUILDROOT_OVERRIDES_DIR}/* ${DOCKER_WORKDIR}/licheepi-nano
fi

cd ${DOCKER_WORKDIR}/buildroot
BR2_EXTERNAL=${DOCKER_WORKDIR}/licheepi-nano make licheepi_nano_defconfig
make toolchain

make linux-source
make uboot-source

