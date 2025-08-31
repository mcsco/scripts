#!/bin/sh

cd /Users/michael/Development/open-webui
source bin/activate
pip install --upgrade open-webui
open-webui serve
