FROM ubuntu:16.04
WORKDIR /
RUN apt-get update && apt-get install -y \
    curl \
    git \
    make \
    pkg-config \
    sudo \
    usbutils \
    wget \
&& rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/techgeeksid/chip-Flash-tool.git
RUN cd /chip-Flash-tool && git pull && chmod +x /chip-Flash-tool/chip.sh
ENTRYPOINT ["/chip-Flash-tool/chip.sh"]
