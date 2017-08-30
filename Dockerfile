FROM debian:jessie

RUN apt-get update && apt-get install -y git libnewlib-arm-none-eabi \
      binutils-arm-none-eabi gcc-arm-none-eabi make unzip wget \
      ca-certificates \
      build-essential cmake libusb-1.0.0-dev --no-install-recommends \
    && useradd -ms /bin/bash chibios \
    && rm -rf /var/lib/apt/lists/*

RUN cd /home/chibios \
    && git clone https://github.com/texane/stlink.git \
    && cd stlink && make release && cp build/Release/st-flash build/Release/st-info /usr/local/bin

USER chibios

RUN cd /home/chibios \
    && wget https://sourceforge.net/projects/chibios/files/ChibiOS_RT%20stable/Version%203.0.1/ChibiOS_3.0.1.zip/download \
    && unzip download \
    && rm download \
    && mkdir src

RUN cd /home/chibios \
    && wget https://sourceforge.net/projects/chibios/files/ChibiOS_RT%20stable/Version%2016.1.0/ChibiOS_16.1.0.zip/download \
    && unzip download \
    && rm download

RUN cd /home/chibios \
    && wget https://sourceforge.net/projects/chibios/files/ChibiOS_RT%20stable/Version%2017.6.0/ChibiOS_17.6.0.zip/download \
    && unzip download \
    && rm download

ENV CHIBIOS_3_0_1 /home/chibios/ChibiOS_3.0.1
ENV CHIBIOS_16_1_0 /home/chibios/ChibiOS_16.1.0
ENV CHIBIOS_17_6_0 /home/chibios/ChibiOS_17.6.0

WORKDIR /home/chibios/src
