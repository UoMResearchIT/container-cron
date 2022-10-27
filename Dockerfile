FROM alpine:3.16

ARG cron_freq
ARG cron_cmd

RUN echo -e "$cron_freq\t$cron_cmd" >> /var/spool/cron/crontabs/root

CMD ["crond", "-f", ">", "/dev/stdout"]
