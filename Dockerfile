FROM 0x01be/theharvester:build as build

FROM alpine

COPY --from=build /opt/theharvester/ /opt/theharvester/

RUN apk add --no-cache --virtual theharvester-runtime-dependencies \
    python3 \
    py3-yaml \
    py3-aiohttp

RUN adduser -D -u 1000 theharvester

USER theharvester

ENV PATH ${PATH}:/opt/theharvester/bin/
ENV PYTHONPATH /usr/lib/python3.8/site-packages/:/opt/theharvester/lib/python3.8/site-packages/

CMD "theHarvester"

