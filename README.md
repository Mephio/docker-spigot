# Docker Image for Spigot

This repository contains a `Dockerfile` that can run a Spigot server. It is intended to be minimal as possible, while still allowing a good amount of configuration.

Automatic builds are provided on Docker Hub as [`academusapp/spigot`](https://hub.docker.com/r/academusapp/spigot), but they might not always be up-to-date wiith the latest Spigot version so we recommend building it yourself for a specific version of Spigot.

A sample `docker-compose.yml` is included for reference.

## Build Args

- `SPIGOT_VERSION` - Use this build argument to set the version of the Spigot server that should be built. Default: `latest`

## Environment Variables

- `SPIGOT_JAVA_FLAGS` - Flags that are passed to `java` when the server starts up. Use this to override the amount of memory allocated to the server or to pass other things to Java. Default: `-Xmx1024M`

## Volumes

- `/spigot` - This is (by default) the working directory of your server will be (will contain `server.properties`, etc.) You can mount it to something on your host so you don't lose your server files.