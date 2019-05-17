# Shotstack RAML Definition

Defines, describes and documents the EditEngine API using RAML.

For current (alpha) documentation: https://shotstack.restlet.io

-----------------

## API Tooling

Unfortunately there doesn't currently seem to be an online API toolkit which ticks all the boxes. Some of the problems include:

- Limited support for RAML 1.0 and no vendors support advanced features like Unions
- Limited language coverage, i.e. no PHP or Ruby
- Ugly, slow or buggy documentation
- Are prohibitively expensive

Therefore the some of the documentation and SDK generation is a bit convoluted. Hopefully the vendors will catch up soon.

The Main vendors currently used are:

- [Restlet Studio](https://studio.restlet.com) - Good support for RAML 1.0 and documentation looks good. Doesn't cover many languages for SDKs (no PHP, Ruby or Python)
- [RestUnited](https://restunited.com) - Creates good SDK libraries in most languages. Doesn't support RAML 1.0 and is dog ugly

### Generating Docs

- Login to Restlet (Using Github) and import the latest api.raml file and overwrite the existing API.

- Once imported documentation will be updated and is available at: https://shotstack.restlet.io.

### Generating SDKs

- Login to Restlet (using Github) and import the latest api.raml file and overwrite the existing API.

- Export the API as Swagger 2.

- Login to RestUnited (using Github) and import the Swagger 2 file exported in the previous step.

- Once imported you can update and create the latest version of the various APIs.

Note: RestUnited currently doesn't detect the response type for each endpoint. Manually set the response type in the interface:

| Enpoint      | Method | Response       |
| ------------ | ------ | -------------- |
| /render      | POST   | QueuedResponse |
| /render/{id} | GET    | RenderResponse |


### Experimental

See build.sh for local SDK and Docs generator
