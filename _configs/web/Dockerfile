FROM        python:3.9-alpine

ENV         PROJECTBASEDIR=/home/app/sample
ENV         PYTHONUNBUFFERED 1
ENV         PYTHONIOENCODING=utf-8

RUN         mkdir -p ${PROJECTBASEDIR}

RUN         apk add --update --no-cache\
            gcc\
            python3-dev\
            postgresql-libs\
            postgresql-dev\
            jpeg-dev\
            zlib-dev\
            && pip3 install pip --upgrade

RUN         apk add --no-cache bash
RUN         apk add --no-cache build-base libxml2-dev libxslt-dev


ADD         https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait ${PROJECTBASEDIR}/wait
RUN         chmod +x ${PROJECTBASEDIR}/wait

ADD         web/requirements.txt ${PROJECTBASEDIR}/
ADD         .env ${PROJECTBASEDIR}/.env

RUN         pip3 install -r ${PROJECTBASEDIR}/requirements.txt

RUN         apk add tzdata

COPY        web/ ${PROJECTBASEDIR}

WORKDIR     ${PROJECTBASEDIR}