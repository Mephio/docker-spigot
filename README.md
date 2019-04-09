# Docker Image for Spigot

This repository contains a `Dockerfile` that can run a Spigot server. It is intended to be minimal as possible, while still allowing a good amount of configuration.

Pre-built images are not available for legal reasons. You will need to build this yourself.

A sample `docker-compose.yml` is included for reference.

## Build Args

- `SPIGOT_VERSION` - Use this build argument to set the version of the Spigot server that should be built. Default: `latest`

## Environment Variables

- `SPIGOT_JAVA_FLAGS` - Flags that are passed to `java` when the server starts up. Use this to override the amount of memory allocated to the server or to pass other things to Java. Default: `-Xmx1024M`

## Volumes

- `/spigot` - This is (by default) the working directory of your server will be (will contain `server.properties`, etc.) You can mount it to something on your host so you don't lose your server files.