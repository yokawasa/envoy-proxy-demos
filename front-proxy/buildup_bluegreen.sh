#!/bin/sh


#mv front-envoy.yaml _front-envoy.yaml
ln -s front-envoy_bluegreen.yaml front-envoy.yaml
docker-compose up --build -d
rm front-envoy.yaml
