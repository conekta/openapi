merge:
	docker run --rm \
	-v ${PWD}:/spec redocly/cli:2.34.0 bundle api.yaml -o /spec/_build/api.yaml

update-readme:
	make merge && rdme openapi _build/api.yaml --id=${API_README_VERSION_2_2_0_ID}  --key=${README_API_KEY}
