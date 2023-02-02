merge:
	swagger-cli bundle api.yaml --outfile _build/api.yaml --type yaml
	
python:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g python -o conekta-python -c config-python.json   

java:
	mkdir -p conekta-java && cp .openapi-generator-ignore conekta-java/.openapi-generator-ignore &&   \
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g java -o conekta-java    \
	-c config-java.json  

go:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g go -o conekta-go  -c config-go.json   --global-property apiTests=false