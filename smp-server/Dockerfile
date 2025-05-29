FROM ghcr.io/paradigmmc/mcman:latest AS mcman

FROM docker.io/itzg/mc-monitor AS mc-monitor

FROM docker.io/library/eclipse-temurin:24-alpine

COPY --from=mcman --chmod=755 /usr/bin/mcman /usr/local/bin/mcman
COPY --from=mc-monitor --chmod=755 /mc-monitor /usr/local/bin/mc-monitor

USER 1000:1000

WORKDIR /template
COPY . .

WORKDIR /server
VOLUME /server

EXPOSE 25565
EXPOSE 25575

ENTRYPOINT [ "/template/entrypoint.sh" ]
