#!/bin/bash

folder=/home/mlally/kaldi/egs/dysper/dysper_audio/train

for file in $(find "$folder" -type f -iname "*.flac")
do
    name=$(basename "$file" .flac)
    dir=$(dirname "$file")
    #echo ffmpeg -i "$file" "$dir"/"$name".wav
    ffmpeg -i $file $dir/$name.wav
    rm -f $file
done
