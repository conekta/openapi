python:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g python -o conekta-python -c config-python.json   

java:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g java -o conekta-java  -c config-java.json    --global-property modelDocs=false \
		--global-property modelTests=false
