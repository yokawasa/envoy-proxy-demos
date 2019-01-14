#!/bin/sh

set -e -x
docker-compose up --build -d

echo "TEST:"
echo "curl -s -v http://localhost:8000/service/blue"
echo "curl -s -v http://localhost:8000/service/green"
echo "curl -s -v http://localhost:8000/service/red"
