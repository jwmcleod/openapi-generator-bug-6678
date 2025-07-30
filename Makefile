index.js: openapi.yaml
	openapi-generator generate -i openapi.yaml -g nodejs-express-server

PHONY: server
server: index.js

PHONY: run
run: index.js
	npm start

PHONY: test
test: index.js
	@echo Test working version
	@curl -X POST http://localhost:3000/works -H "accept: */*" -H "Content-Type: application/json" -d '{"data":"The data"}'
	@echo
	@echo Test failing version
	@curl -X POST http://localhost:3000/fails -H "accept: */*" -H "Content-Type: application/json" -d '{"data":"The data"}'
