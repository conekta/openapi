FROM openapitools/openapi-generator-cli:v6.4.0 as builder

WORKDIR /app

COPY parameters/ parameters/
COPY requestBodies  requestBodies/
COPY resources resources/
COPY schemas schemas/
COPY templates templates/
COPY Makefile Makefile
COPY api.yaml api.yaml
