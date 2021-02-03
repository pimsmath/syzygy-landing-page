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
    if [ ! -f ${file} ] ; then
        echo "Unable to find ${file}"
        exit 1
    fi
    sed "s/XXXSITENAME/${SITENAME}/g" $file
    if [ $? -ne 0 ] ; then
        echo "Unable to process SITENAME for find ${file}"
        exit 1
    fi
    sed "s/XXXUNIVNAME/${UNIVNAME}/g" $file
    if [ $? -ne 0 ] ; then
        echo "Unable to process UNIVNAME for find ${file}"
        exit 1
    fi
done
