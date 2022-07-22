FROM debian:11.4-slim as builder

LABEL Description="Base image with PHP 8.x based on Debian"
LABEL name="spx-profiler-debian11"

RUN apt update && apt upgrade -y && \
    apt install -y \
        lsb-release \
        ca-certificates \
        apt-transport-https \
        software-properties-common \
        gnupg2 \
        wget \
        curl \
        git \
        make\
        zlib1g-dev \
        && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    apt update && \
    apt install -y php8.0-dev

# docker build -t php-spx-debian:11.4 --rm .
# docker run -it --rm -v$(PWD)/:/tmp php-spx-debian:11.4 bash
