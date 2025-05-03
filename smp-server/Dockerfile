FROM ghcr.io/paradigmmc/mcman:latest AS builder
WORKDIR /server
COPY . .

# server config variables
ARG RCON_PASSWORD
ENV RCON_PASSWORD=$RCON_PASSWORD

RUN mcman build


# Needed for healthcheck
FROM itzg/mc-monitor AS mc-monitor


FROM eclipse-temurin:24-alpine

USER 1000:1000
WORKDIR /server

# TODO: pass user as build arg
COPY --from=builder --chown=1000:1000 /server/server/ /server

# volumes
VOLUME /server/universe
VOLUME /server/databases
VOLUME /server/logs
VOLUME /server/squaremap/web

# ports
EXPOSE 25565
EXPOSE 25575

# copy executable for healthcheck
COPY --from=mc-monitor --chmod=755 /mc-monitor /usr/local/bin/mc-monitor

ENTRYPOINT [ "/server/start.sh" ]
