#!/bin/bash -xe

DISTRO="nano-5.11"
. ./${DISTRO}/env.sh

docker run -it --rm \
    --net=host --env="DISPLAY" --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume ${HOME}:${HOME} \
    --volume $(pwd)/out:${DOCKER_WORKDIR} \
    --volume $(pwd)/${DISTRO}:${DOCKER_WORKDIR}/${DISTRO} \
    "${DOCKER_IMAGE_TAG}" \
    $1

