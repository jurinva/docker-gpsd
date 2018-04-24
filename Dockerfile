FROM alpine
RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && apk update && apk add --no-cache gpsd
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/sbin/gpsd -N -n -G ${*} -F /var/run/gpsd.sock /dev/gps0","--"]
