# Test file for ([BUG][NodeJS-Express-Server ReferenceRequestBodies are not parsed by the controller #6678)[https://github.com/OpenAPITools/openapi-generator/issues/6678]
## Requirements
### Initial version
The initial version requires @openapitools/openapi-generator-cli@1.0.15-5.0.0-beta, and node-v14.15.0.
This shows the problem, as noted below.

### Final version
The final version was tested using @openapitools/openapi-generator-cli v 2.21.04 and node v22.15.0

## Execution
Install openapi-generator locally
```bash
npm install @openapitools/openapi-generator-cli
```

Create and run the server:
```base
make server
make run
```

Run the test in another window.

```bash
$ make test
Test working version
{}
Test failing version
Cannot read property 'application/json' of undefined
```

When the bug is not present, the test run looks like


```bash
$ make test
Test working version
{}
Test failing version
{}
```

