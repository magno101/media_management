#!/bin/bash

docker-compose up -d

docker-compose stop

docker cp ./custom/pia/. pia:/pia
docker cp ./custom/sonarr/config/. sonarr:/config
docker cp ./custom/radarr/config/. radarr:/config
docker cp ./custom/lidarr/config/. lidarr:/config

docker-compose start