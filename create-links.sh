#!/bin/bash
shopt -s dotglob

currentDir=$(pwd)
settings=$currentDir/settings/*

for file in $settings;
do
  fileName=${file##*/}
  echo "Linking file: $fileName"
  ln -sfn $file $HOME/$fileName
done
