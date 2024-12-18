# Speed Limits Map

This is a set of files to prepare an interactive speed limits map.

1. Get a [bounding box](https://boundingbox.klokantech.com/).
2. Put it into `prepare.sh` and `config-kiirus.json` (lat-lon reversed in the latter).
3. Run `./prepare.sh`.
4. Edit `index.html` for the title, the initial location and maybe speed brackets (twice: in the legend and in the code, look for `speeds-`).
5. Run `./serve.sh` and open [localhost:8000](http://localhost:8000) to test the page.
6. Publish `index.html`, `positron.json`, and `kiirus.mbtiles` somewhere.

Written by Ilya Zverev, published under the ISC License.
