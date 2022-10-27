FROM alpine:3.16

ADD cronjob.sh /
RUN chmod +x /cronjob.sh

ENTRYPOINT [ "sh", "-c", "/cronjob.sh"]
