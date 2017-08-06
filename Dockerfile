FROM ubuntu:16.04
WORKDIR /
RUN apt-get update && apt-get install -y \
    android-tools-fastboot \
    android-tools-fsutils \
    build-essential \
    curl \
    git \
    lib32stdc++6 \
    lib32z1 \
    libc6-i386 \
    libusb-1.0-0-dev \
    make \
    pkg-config \
    sudo \
    u-boot-tools \
    usbutils \
    wget \
&& rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/techgeeksid/chip-Flash-tool.git
RUN cd /chip-Flash-tool && git pull && chmod +x /chip-Flash-tool/chip.sh
ENTRYPOINT ["/chip-Flash-tool/chip.sh"]
