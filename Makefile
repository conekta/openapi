merge:
	docker run --rm \
	-v ${PWD}:/local openapitools/openapi-generator-cli:v7.24.0 generate \
	-g openapi-yaml \
	-i /local/api.yaml \
	-p outputFile=local/_build/api.yaml \
	--skip-validate-spec
	sed -i.bak '/^[[:space:]]*default: null$$/d' _build/api.yaml && rm -f _build/api.yaml.bak

update-readme:
	make merge && rdme openapi upload --key=${README_API_KEY} --branch=v2.3.0 --slug=conekta-api  _build/api.yaml 
