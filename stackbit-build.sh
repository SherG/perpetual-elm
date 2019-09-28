#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5d8f09c9f96d2a00158344b4 
fi
cd exampleSite && hugo --gc --baseURL "/" --themesDir ../.. && cd ..
./inject-netlify-identity-widget.js exampleSite/public
