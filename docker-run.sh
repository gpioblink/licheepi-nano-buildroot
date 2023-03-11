#!/bin/bash -xe

DISTRO="nano-5.11"
. ./${DISTRO}/env.sh

docker run -it --rm \
    --volume ${HOME}:${HOME} \
    --volume $(pwd)/out:${DOCKER_WORKDIR} \
    --volume $(pwd)/${DISTRO}:${DOCKER_WORKDIR}/${DISTRO} \
    "${DOCKER_IMAGE_TAG}" \
    $1

