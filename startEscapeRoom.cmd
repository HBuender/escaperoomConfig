ECHO "Stop Container"
call docker stop escaperoom
call docker stop escaperoomclient

ECHO "Remove Container"
call docker rm escaperoom
call docker rm escaperoomclient

ECHO "Start Fresh Container"
call docker run -d -e "SPRING_PROFILES_ACTIVE=KV2" -p8080:8080 --name escaperoom hbuender/escaperoom
REM call docker run -d -p80:80 --env API_URL="http://207.154.204.200:8080/"  --name escaperoomclient  hbuender/escaperoomclient
call docker run -d -p80:80 --env API_URL="http://localhost:8080/"  --name escaperoomclient  hbuender/escaperoomclient
