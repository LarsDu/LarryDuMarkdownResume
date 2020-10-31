#!/bin/sh
# Requires Inkscape 1.0.1 or above
for file in svg/*.svg
do
    echo 'Converting '$file' to png'
    filename=${file##*/}
    inkscape $file -w 15 -o png/${filename%svg}png
done
