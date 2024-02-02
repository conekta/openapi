FROM node:14 as builder

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean;

RUN npm install @openapitools/openapi-generator-cli -g
RUN openapi-generator-cli version-manager set 7.2.0
WORKDIR /app

COPY parameters/ parameters/
COPY requestBodies  requestBodies/
COPY resources resources/
COPY schemas schemas/
COPY templates templates/
COPY Makefile Makefile
COPY api.yaml api.yaml
