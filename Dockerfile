FROM ubuntu:18.04 AS base

# cache apt-get update results
RUN apt-get update

# install build prerequisites
# @todo remove python3-distutils after upgrading U-Boot
RUN apt-get install -qy \
    bc \
    bison \
    build-essential \
    bzr \
    chrpath \
    cpio \
    cvs \
    devscripts \
    diffstat \
    dosfstools \
    fakeroot \
    flex \
    gawk \
    git \
    libncurses5-dev \
    libssl-dev \
    locales \
    python3-dev \
    python3-distutils \
    python3-setuptools \
    rsync \
    subversion \
    swig \
    texinfo \
    unzip \
    wget \
    whiptail \
    xterm \
    x11-apps \
    gawk wget git-core diffstat unzip texinfo \
    gcc-multilib build-essential chrpath socat cpio python python3 \
    python3-pip python3-pexpect xz-utils debianutils iputils-ping \
    libsdl1.2-dev xterm tar locales net-tools rsync sudo nano vim curl zstd liblz4-tool

# external toolchain needs this
# Set up locales
# Set up locales
RUN locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Add your user to sudoers to be able to install other packages in the container.
ARG USER
RUN echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}

# Set the arguments for host_id and user_id to be able to save the build artifacts
# outside the container, on host directories, as docker volumes.
ARG host_uid \
    host_gid
RUN groupadd -g $host_gid zli && \
    useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER

# builds should run as a normal user.
USER $USER

ARG DOCKER_WORKDIR
WORKDIR ${DOCKER_WORKDIR}

