#/bin/usr/env bash -xe

BUILDROOT_RELEASE="2020.02"

cd ${DOCKER_WORKDIR}
mkdir -p ${DOCKER_WORKDIR}/buildroot

wget -qO- http://buildroot.org/downloads/buildroot-${BUILDROOT_RELEASE}.tar.gz | tar --strip-components=1 -xz

cd ${DOCKER_WORKDIR}
mkdir -p ${DOCKER_WORKDIR}/licheepi-nano-sdk

echo 'name: LICHEEPI_NANO_SDK' >> external.desc
echo 'desc: LicheePi Nano SDK only' >> external.desc
touch external.mk Config.in
cp -r ${BUILDROOT_OVERRIDES_DIR}/* ${DOCKER_WORKDIR}/licheepi-nano-sdk

# compile the SDK
BR2_EXTERNAL=${DOCKER_WORKDIR}/licheepi-nano-sdk make licheepi_nano_sdk_defconfig
make sdk
