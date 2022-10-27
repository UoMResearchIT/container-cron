# Container-Cron #

This container runs a regularly scheduled cron job, specified through environment variables.

## Details ##

This container uses two environment variables:

`cron_freq`: The cron timing string e.g. `'*/1 * * * *'` ([help](https://crontab.guru/ "Crontab Guru"))

`cron_cmd`: The command for cron to run e.g. `'echo hello > world.txt'`

## Example usage ##

### Container build ###

Generally a pre-built image (available [here](ghcr.io/uomresearchit/container-cron "Conatiner cron link")), should be used. If you wish to build locally for your own testing please issue:

> docker build . -t container-cron

### Local interactive usage ###

To echo the date command into a file every minute:

> docker run --env cron_freq='*/1 * * * *' --env cron_cmd='date >> /crontest.csv' container-cron

### Prebuilt interactive usage ###

> docker run --env cron_freq='*/1 * * * *' --env cron_cmd='date >> /crontest.csv' ghcr.io/uomresearchit/container-cron

### Compose usage ###

The containers example use in a docker-compose.yml file is demonstrated in [this file](docker-compose.yml "Docker Compose").

Its contents is reproduced here

```version: "3.9"
services:
  container-cron:
    build: .
    environment:
      - cron_freq=*/1 * * * *
      - cron_cmd=date >> /crontest.csv
```

n.b. the "build" command here is to use a locally built container, in general usage you should specify the pre-built image per:

```
services:
  container-cron:
    image: ghcr.io/uomresearchit/container-cron
    environment:
      - cron_freq=*/1 * * * *
      - cron_cmd=date >> /crontest.csv
```
