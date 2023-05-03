API_README_VERSION_ID = 641deb4041d58005f2c45bf3
merge:
	npx @openapitools/openapi-generator-cli  generate -g openapi-yaml -i api.yaml -p outputFile=_build/api.yaml --skip-validate-spec
	
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
	mkdir -p conekta-.net && \
	cp .openapi-generator-ignore conekta-.net/.openapi-generator-ignore &&   \
	rm -rf ../conekta-.net/docs && \
	rm -rf ../conekta-.net/src/Conekta.net/Model && \
	npx @openapitools/openapi-generator-cli generate \
    -i api.yaml \
    -g csharp-netcore \
    -o ../conekta-.net \
    -c config-netcore.json \
    --global-property modelTests=false

php:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g php -o conekta-php  -c config-php.json

node:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g typescript-fetch -o conekta-node -c config-node.json

update-readme:
	make merge && rdme openapi _build/api.yaml --id=$(API_README_VERSION_ID)  --key=${README_API_KEY}
