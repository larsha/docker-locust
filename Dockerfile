FROM alpine:latest

RUN apk -U add ca-certificates python python-dev py-pip build-base && \
    pip install locustio pyzmq && \
    apk del python-dev && \
    rm -r /var/cache/apk/* && \
    mkdir /locust

WORKDIR /locust

ONBUILD ARG PATH_TO_LOCUST .
ONBUILD ADD $PATH_TO_LOCUST /locust
ONBUILD RUN test -f requirements.txt && pip install -r requirements.txt; exit 0

EXPOSE 8089
