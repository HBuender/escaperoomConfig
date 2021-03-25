#!/bin/bash

echo "Stop Container"
docker stop escaperoom
docker stop escaperoomclient

echo "Remove Container"
docker rm escaperoom
docker rm escaperoomclient

echo "Start Fresh Container"
docker run -d -e "SPRING_PROFILES_ACTIVE=PD" -p8080:8080 --name escaperoom hbuender/escaperoom
docker run -d -p80:80 --env API_URL="http://207.154.204.200:8080/"  --name escaperoomclient  hbuender/escaperoomclient

