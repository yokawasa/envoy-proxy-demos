#!/bin/sh

ln -s front-envoy_headermatch.yaml front-envoy.yaml
docker-compose up --build -d
rm front-envoy.yaml

echo "TEST:"
echo "curl -s http://localhost:8000/service/blue"
echo "curl -s -H 'x-canary-version: service_green' http://localhost:8000/service/blue"
echo "curl -s http://localhost:8000/service/red"
