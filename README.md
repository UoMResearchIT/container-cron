# Container-Cron #

This container runs a regularly scheduled cron job, specified through environment variables.

## Details ##

This container uses two environment variables:

`cron_freq`: The cron timing string e.g. `'*/1 * * * *'` ([help](https://crontab.guru/ "Crontab Guru"))

`cron_cmd`: The command for cron to run e.g. `'echo hello > world.txt'`

## Example usage ##

Two examples of usage will be given, the envisioned usage of the pre-built package (available [here](ghcr.io/uomresearchit/container-cron "Conatiner cron link")) and details on how to build and run the package locally.

---
### Use of pre-built image ###

Two methods for using the pre-built package are detailed here, using docker run and docker-compose.

#### Prebuilt interactive usage (docker run) ####

To use the pre-built package from the command line the docker run command is used with the user specifying environment varables. For example, to echo the date command into a file every minute:

```bash
$ docker run --env cron_freq='*/1 * * * *' --env cron_cmd='date >> /crontest.csv' ghcr.io/uomresearchit/container-cron
```

#### Prebuilt compose usage (docker-compose) ####

To use the pre-built package in a docker-compose swarm (see also [this file](docker-compose.yml "Docker Compose")):

```
services:
  container-cron:
    image: ghcr.io/uomresearchit/container-cron
    environment:
      - cron_freq=*/1 * * * *
      - cron_cmd=date >> /crontest.csv
```

---
### Local self-built usage ###

The following examples give usage for locally developing and testing the package.

#### Container build ####

To build locally:

```
docker build . -t container-cron
```

#### Interactive usage ####

To run a locally built package:

```
docker run --env cron_freq='*/1 * * * *' --env cron_cmd='date >> /crontest.csv' container-cron
```

### Compose usage ###

To use a local image in docker-compose

```version: "3.9"
services:
  container-cron:
    build: .
    environment:
      - cron_freq=*/1 * * * *
      - cron_cmd=date >> /crontest.csv
```
