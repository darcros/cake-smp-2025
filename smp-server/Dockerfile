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

# ports
EXPOSE 25565
EXPOSE 25575

# healthcheck
COPY --from=mc-monitor --chmod=755 /mc-monitor /usr/local/bin/mc-monitor
HEALTHCHECK --interval=5s --start-period=60s --retries=5 \
  CMD mc-monitor status --host localhost --port 25565

ENTRYPOINT [ "/server/start.sh" ]
