FROM alpine:latest

RUN apk -U add ca-certificates python python-dev py-pip build-base && \
    pip install locustio pyzmq && \
    apk del python-dev && \
    rm -r /var/cache/apk/* && \
    mkdir /locust

ARG path
WORKDIR /locust

ONBUILD ADD "$path" /locust
ONBUILD RUN test -f requirements.txt && pip install -r requirements.txt; exit 0

EXPOSE 8089
ENTRYPOINT [ "/usr/bin/locust" ]
