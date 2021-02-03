#!/bin/bash

if [ "$#" -ne 2 ]; then
   echo "Illegal number of arguments"
   echo "Usage: $0 <SITENAME> <UNIVNAME>"
   exit 1
fi

SITENAME=$1
UNIVNAME=$2

FILES=('index.html' 'index.xml' 'tags/index.xml' 'categories/index.xml')

for file in ${FILES[@]}; do
    echo "Processing $file"
    sed "s/XXXSITENAME/${SITENAME}/g" $file
    sed "s/XXXUNIVNAME/${UNIVNAME}/g" $file
done
