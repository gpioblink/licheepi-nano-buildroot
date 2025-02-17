#/bin/bash -xe

source ./env.sh

BUILDROOT_RELEASE="2020.02"

mkdir -p ${DOCKER_WORKDIR}/buildroot
cd ${DOCKER_WORKDIR}/buildroot

wget -qO- http://buildroot.org/downloads/buildroot-${BUILDROOT_RELEASE}.tar.gz | tar --strip-components=1 -xz

mkdir -p ${DOCKER_WORKDIR}/licheepi-nano-sdk
cd ${DOCKER_WORKDIR}/licheepi-nano-sdk

echo 'name: LICHEEPI_NANO_SDK' >> external.desc
echo 'desc: LicheePi Nano SDK only' >> external.desc
touch external.mk Config.in
cp -r ${BUILDROOT_OVERRIDES_DIR}/* ${DOCKER_WORKDIR}/licheepi-nano-sdk

# compile the SDK
cd ${DOCKER_WORKDIR}/buildroot
BR2_EXTERNAL=${DOCKER_WORKDIR}/licheepi-nano-sdk make licheepi_nano_sdk_defconfig
make sdk
