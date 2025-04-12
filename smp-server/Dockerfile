FROM ghcr.io/paradigmmc/mcman:latest AS builder
WORKDIR /server
COPY . .

# server config variables
ARG RCON_PASSWORD
ENV RCON_PASSWORD=$RCON_PASSWORD

RUN mcman build


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

# TODO: healthcheck
ENTRYPOINT [ "/server/start.sh" ]
