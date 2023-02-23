merge:
	swagger-cli bundle api.yaml --outfile _build/api.yaml --type yaml
	
python:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g python-nextgen -o conekta-python -c config-python.json   

java:
	mkdir -p conekta-java && cp .openapi-generator-ignore conekta-java/.openapi-generator-ignore &&   \
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g java -o conekta-java    \
	-c config-java.json  

go:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g go -o conekta-go  -c config-go.json   --global-property apiTests=false

ruby:
	mkdir -p conekta-ruby && cp .openapi-generator-ignore conekta-ruby/.openapi-generator-ignore &&   \
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g ruby -o conekta-ruby  -c config-ruby.json 

csharp:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g csharp-netcore -o conekta-netcore  -c config-netcore.json

php:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g php -o conekta-php  -c config-php.json

node:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g typescript-fetch -o conekta-node -c config-node.json