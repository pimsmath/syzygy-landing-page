#!/bin/bash

ASSETS="CNAME
LICENSE
README.md
_config.yml
_includes
_layouts
_plugins
_site
ansible.sh
css
font-awesome
fonts
img
index.html
js
logout"

for asset in $ASSETS ; do
    rm -rf $asset
    mv _site site
done
