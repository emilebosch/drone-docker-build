FROM alpine:3.3
RUN apk --update --no-cache add docker
ENV DOCKER_HOST=unix:///var/run/host.sock