#!/bin/sh
if [ ! -e .venv ]; then
  python3 -m venv .venv
  .venv/bin/pip install rangehttpserver
fi
.venv/bin/python3 -m RangeHTTPServer
