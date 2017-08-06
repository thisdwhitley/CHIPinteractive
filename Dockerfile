FROM ubuntu:16.04
WORKDIR /
RUN apt-get update && apt-get install -y \
    curl \
    git \
    make \
    sudo \
    usbutils \
    wget \
&& rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/NextThingCo/CHIP-SDK.git
RUN export logname=root && /bin/bash CHIP-SDK/setup*
RUN git clone https://github.com/dswhitley/CHIPinteractive.git
ENTRYPOINT ["/bin/bash /CHIPinteractive/menu.sh"]
