#!/bin/bash
# run a bare pythin function using uwsgi.
# this will serve simple string on port 8000
# and note, no web server is being used!
uwsgi --http :8000 --uwsgi-file $1
