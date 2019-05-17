#!/bin/bash

#######################################################
# Experimental SDK  and Docs generator
#
# Setup:
#
# https://github.com/mulesoft/oas-raml-converter
# `npm install --save oas-raml-converter`
#
# https://openapi-generator.tech
# `npm install @openapitools/openapi-generator-cli -g`
#
#######################################################

# Prepare build dir
rm -r build
mkdir build

# Convert RAML 1 to OAS 3
node convert.js

# PHP SDK
openapi-generator generate -i ./build/api.oas3.json -g php -o ./build/php --invoker-package Shotstack

printf "\n========================================= \n"
printf "\nDONE\n-- Now check for strange class names in defaultApi - i.e. gETRender()\n"
printf "\n========================================= \n"
