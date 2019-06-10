#!/bin/bash

str=$(xmllint -xpath '/manifest/project[@remote="rk"]/@path | /manifest/project[@remote="rk"]/@name' manifest.xml | xargs -n2)

while IFS=$' ' read -r name path; do
  pushd ../${path:5}
  sname=${name:5}
  hub create a9rock64/${sname//\//_}
  git push --all origin
  popd
done <<< $str
