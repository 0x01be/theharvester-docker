FROM alpine as build

RUN apk add --no-cache --virtual theharvester-docker-0x01 \
    git \
    build-base \
    python3-dev \
    py3-pip \
    py3-yaml \
    py3-aiohttp

ENV THEHARVESTER_REVISION master
RUN git clone --depth 1 --branch ${THEHARVESTER_REVISION} https://github.com/laramies/theHarvester.git /theharvester

WORKDIR /theharvester
RUN pip3 install --prefix=/opt/theharvester .
RUN python3 setup.py install --prefix=/opt/theharvester

