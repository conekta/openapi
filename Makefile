API_README_VERSION_ID = 641deb4041d58005f2c45bf3
merge:
	npx @openapitools/openapi-generator-cli generate \
	-g openapi-yaml \
	-i api.yaml \
	-p outputFile=_build/api.yaml \
	--skip-validate-spec
	
php:
	npx @openapitools/openapi-generator-cli generate \
		-i api.yaml \
		-g php \
		-o ../conekta-php \
		-c config-php.json \
		--global-property modelTests=false

node:
	rm -rf ../conekta-node/api && \
	rm -rf ../conekta-node/model && \
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g typescript-axios \
	 -o ../conekta-node  -c config-node.json  \
	 --global-property apiDocs=false  --global-property apiTests=true 

dart:
	rm -rf ../conekta-dart/lib && \
	rm -rf ../conekta-dart/doc && \
	rm -rf ../conekta-dart/lib/src/model && \
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g dart-dio \
	 -o ../conekta-dart \
	 -c config-dart.json  \
	 --global-property modelTests=false

update-readme:
	make merge && rdme openapi _build/api.yaml --id=$(API_README_VERSION_ID)  --key=${README_API_KEY}
