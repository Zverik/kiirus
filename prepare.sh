#!/bin/sh
set -e -u -x

if [ ! -e kiirus.osm.pbf ]; then
  echo Downloading data...
  BBOX=59.2360,24.3916,59.5319,24.9857
  curl -L -o kiirus.osm "https://overpass-api.de/api/interpreter?data=%5Bout%3Axml%5D%5Btimeout%3A25%5D%3B%0Away%5B%22highway%22~%22%28motorway%7Ctrunk%7Cprimary%7Csecondary%7Ctertiary%7Cresidential%7Cunclassified%7Cliving_street%29%28_link%29%3F%22%5D%28${BBOX//,/%2C}%29%3B%0A%28._%3B%3E%3B%29%3B%0Aout%20meta%3B"
  osmium cat -o kiirus.osm.pbf kiirus.osm
  rm kiirus.osm
fi

echo Preparing vector tiles...
if which tilemaker; then
  tilemaker /data/kiirus.osm.pbf \
    --output /data/kiirus.pmtiles \
    --config /data/config-kiirus.json \
    --process /data/process-kiirus.lua
else
  docker run -it --rm --pull always -v $(pwd):/data \
    ghcr.io/systemed/tilemaker:master \
    /data/kiirus.osm.pbf \
    --output /data/kiirus.pmtiles \
    --config /data/config-kiirus.json \
    --process /data/process-kiirus.lua
fi
