echo -e "$cron_freq\t$cron_cmd" >> /var/spool/cron/crontabs/root
crond -f -L /dev/stdout
