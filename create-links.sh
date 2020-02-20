#!/bin/bash
shopt -s dotglob

currentDir=$(pwd)
echo $currentDir
echo $HOME

settings=$currentDir/settings/*
for file in $settings;
do
  fileName=${file##*/}
  echo "Linking file: $fileName"
  ln -sfn $file $HOME/$fileName
done
