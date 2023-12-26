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

update-readme:
	make merge && rdme openapi _build/api.yaml --id=$(API_README_VERSION_ID)  --key=${README_API_KEY}
