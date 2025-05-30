# Cake SMP

## Running

All the stuff in this repo has been written to work with [podman](https://podman.io/) and [podman-compose](https://github.com/containers/podman-compose) in rootless mode.

To start the server:

1. Create the `.env` file as described below.
2. Run the following command in the root of the repository:

```bash
podman compose up -d
```

## Environment variables

Create a `.env` file in the root of the repository and add the following variables:

| Name                    | Description                        |
| ----------------------- | ---------------------------------- |
| RCON_PASSWORD           | Password for RCON access           |
| RCON_WEB_ADMIN_PASSWORD | Password for RCON web admin access |
