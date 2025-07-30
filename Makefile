index.js: openapi.yaml
	npx openapi-generator-cli generate -i openapi.yaml -g nodejs-express-server

PHONY: server
server: index.js

PHONY: run
run: index.js
	npm start

PHONY: test
test: index.js
	@echo Test working version
	@curl -X POST http://localhost:8080/works -H "accept: */*" -H "Content-Type: application/json" -d '{"data":"The data"}'
	@echo
	@echo Test failing version
	@curl -X POST http://localhost:8080/fails -H "accept: */*" -H "Content-Type: application/json" -d '{"data":"The data"}'

PHONY: clean
clean:
	rm -rf api
	rm -rf controllers
	rm -rf node_modules
	rm -rf .openapi-generator
	rm -rf services
	rm -rf uploaded_files
	rm -rf utils
	rm -f *.log
	rm -f *.js
	rm -f .eslintrc.json
	rm -f .openapi-generator-ignore
	rm -f package.json
	rm -f package-lock.json
	rm -f README.md
