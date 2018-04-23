FROM alpine
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && apk update && apk add --no-cache gpsd
CMD ["/bin/sh"]
