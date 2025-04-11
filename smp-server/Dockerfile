FROM ghcr.io/paradigmmc/mcman:latest AS builder
WORKDIR /server
COPY . .
RUN mcman build

FROM eclipse-temurin:24-alpine
USER 1000:1000
WORKDIR /server
COPY --from=builder --chown=1000:1000 /server/server/ /server
ENTRYPOINT [ "/server/start.sh" ]
