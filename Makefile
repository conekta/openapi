merge:
	docker run --rm \
	-v ${PWD}:/spec redocly/cli:2.34.0 bundle api.yaml -o /spec/_build/api.yaml

update-readme:
	make merge && rdme openapi upload --key=${README_API_KEY} --branch=v2.3.0 --slug=conekta-api  _build/api.yaml 
