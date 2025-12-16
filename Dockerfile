FROM public.ecr.aws/docker/library/node:20 as builder

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless && \
    apt-get clean;

RUN npm install @openapitools/openapi-generator-cli -g
RUN openapi-generator-cli version-manager set 7.13.0
WORKDIR /app

COPY parameters/ parameters/
COPY requestBodies  requestBodies/
COPY resources resources/
COPY schemas schemas/
COPY Makefile Makefile
COPY api.yaml api.yaml
