#!/bin/bash

# Echo each command
set -x

# Stop the script on errors
set -e

# Command to clean and package your project
mvn clean package
mvn install

# Generate API
mvn endpoints-framework:openApiDocs
gcloud endpoints services deploy target/openapi-docs/openapi.json

# Command to deploy
mvn appengine:deploy

