# Spigot builder - runs BuildTools.jar and creates the Spigot jar file
FROM java:openjdk-8-jdk-alpine AS builder
WORKDIR /build

RUN apk add git wget --no-cache

ARG SPIGOT_VERSION=latest

RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -Xmx1024M -jar BuildTools.jar --rev ${SPIGOT_VERSION}

# Actual Spigot image - runs Spigot
# To increase compatibility, you can change the base image to openjdk:8 (see README)
FROM openjdk:8 
WORKDIR /spigot

ENV SPIGOT_JAVA_FLAGS="-Xmx2048M"

COPY --from=builder /build/spigot*.jar /usr/bin/spigot.jar

# You may wish to remove the `--noconsole` argument if you
# are attaching to STDIN to allow commands
ENTRYPOINT java $SPIGOT_JAVA_FLAGS -jar /usr/bin/spigot.jar --noconsole
EXPOSE 25565
