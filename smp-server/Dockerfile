FROM ghcr.io/paradigmmc/mcman:latest AS builder
WORKDIR /server
COPY . .

ARG RCON_PASSWORD
ENV RCON_PASSWORD=$RCON_PASSWORD

RUN mcman build


FROM eclipse-temurin:24-alpine

USER 1000:1000
WORKDIR /server
COPY --from=builder --chown=1000:1000 /server/server/ /server

# Minecraft server port
EXPOSE 25565

# RCON port
EXPOSE 25575

ENTRYPOINT [ "/server/start.sh" ]
