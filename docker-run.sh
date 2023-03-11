#!/bin/bash -xe

DISTRO="nano-5.11"
OUTPUT_DIR="out"
. ./${DISTRO}/env.sh

if [ ! -d ${OUTPUT_DIR} ]; then
	mkdir -p ${OUTPUT_DIR}
fi

docker run -it --rm -u `id -u`:`id -g` \
    --net=host --env="DISPLAY" --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume ${HOME}:${HOME} \
    --volume $(pwd)/out:${DOCKER_WORKDIR} \
    --volume $(pwd)/${DISTRO}:${DOCKER_WORKDIR}/${DISTRO} \
    "${DOCKER_IMAGE_TAG}:latest" \
    $1

