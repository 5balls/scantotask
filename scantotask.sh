#!/bin/bash
temp_png_file=$(mktemp -u --suffix=.png -q)
temp_txt_file=$(mktemp -u --suffix=.txt -q)
temp_txt_file_without_suffix=$(dirname $temp_txt_file)/$(basename -s .txt $temp_txt_file)
scanimage \
  -d 'mustek_usb:libusb:001:003' \
  --format=png \
  -o $temp_png_file \
  --mode Lineart \
  --resolution 600 \
  -l 0 \
  -t 0 \
  -x 105 \
  -y 148
mogrify \
  -crop 2180x3496+150+0 \
  $temp_png_file
tesseract \
  $temp_png_file \
  $temp_txt_file_without_suffix \
  --dpi 600 \
  -l deu
awk '/^[0-9A]+[ ]*./{if(length(currenttask)!=0) {print currenttask; } currenttask=$0; sub(/^[0-9A]+[ ]*.[ ]*/,"",currenttask);}; !/^[0-9A]+[ ]*./{if(length(currenttask)!=0) {currenttask=currenttask" "$0;}}' $temp_txt_file | while read -r task
do
  task add $task
done
rm $temp_png_file $temp_txt_file
