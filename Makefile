python:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g python -o conekta-python -p packageName=conekta -p generateSourceCodeOnly=false -p packageVersion=2.6.2 -p packageUrl=https://developers.conekta.com/ -p projectName=conekta-python

java:
	npx @openapitools/openapi-generator-cli generate -i  api.yaml -g java -o conekta-java  -c config-java.json   
