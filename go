#!/bin/bash -ex
cd app
../node_modules/bs-platform/bin/bsc react.ml reactdom.ml test_react.ml -safe-string
cd ..

node_modules/.bin/browserify \
  app/test_react.js -d -x react -x react-dom -v -o app/app.js
