FROM arm64v8/ubuntu:focal
# Note:
# Here copy the /usr/bin/qemu-system-aarch64 to local bin folder
# COPY ./bin/qemu-system-aarch64 /usr/bin/qemu-system-aarch64

ARG DEBIAN_FRONTEND=noninteractive

# Basic apt update
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends locales ca-certificates 
 
# Set the locale to en_US.UTF-8, because the Yocto build fails without any locale set.
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y python3-pip
RUN pip3 install -U --user wheel mock pillow
RUN pip3 install setuptools==58.3.0

RUN uname -a
