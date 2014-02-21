#!/bin/bash

# usage: slideshow.sh directory-with-slides

slide_dir=$1

slides=

i=0
for slide in $slide_dir/*; do
  [ -d $slide ] && continue

  slides[$i]=$slide
  (( i++ ))
done

i=0
while [ -n "${slides[$i]}" ]; do

  if [ -x ${slides[$i]} ]; then
    ${slides[$i]}
  else
    ./present.rb "$(cat ${slides[$i]})"
    if [ $? -ne 0 ]; then
      (( i-- ))
      clear
      continue
    fi
  fi

  (( i++ ))

  clear
done
