#!/bin/bash

ASSETLIST="CNAME
LICENSE
README.md
_config.yml
_includes
_layouts
_plugins
ansible.sh
css
font-awesome
fonts
img
index.html
js
logout"

BRANCHES=`git branch | grep -E '^\*' | cut -d' ' -f 2`
if [[ $BRANCHES =~ ^ansible$ ]] ; then
    echo "On Branch ansible"
    gsed -i 's/xxx-host-xxx/{{ ansible_hostname }}/g' _config.yml
    jekyll build
    for asset in $ASSETLIST ; do
        echo $asset
        rm -rf $asset
    done
    mv _site site
else
    echo "Not on ansible branch"
    exit 1
fi
