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
openapi-generator generate -i ./build/api.oas3.json -g php -o ./build/php \
                  --invoker-package Shotstack\\\\CLient

printf "\n========================================= \n"
printf "\nPHP SDK Generated"
printf "\n\nNow fix:"
printf "\n-- strange class names in defaultApi - i.e. gETRender()\n"
printf "\n-- OneOfTitleAssetImageAssetVideoAsset to Asset - see commit: http://tiny.cc/8jyu6y\n"
printf "\n========================================= \n"

# Ruby SDK

openapi-generator generate -i ./build/api.oas3.json -g ruby -o ./build/ruby \
                  --additional-properties=moduleName="Shotstack"

printf "\n========================================= \n"
printf "\nRuby SDK Generated"
printf "\n\nNow fix:"
printf "\n-- strange class names in defaultApi - i.e. g_et_ender()\n"
printf "\n-- OneOfTitleAssetImageAssetVideoAsset to Asset - see commit: http://tiny.cc/5i4w6y\n"
printf "\n========================================= \n"
