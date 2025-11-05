#!/bin/bash
input="$1"
size="$2"
output="$3"

#sudo pacman -S --needed unzip imagemagick

tmpdir=$(mktemp -d)
unzip -qq "$input" "Metadata/plate_1.png" -d "$tmpdir" || exit 1
img="$tmpdir/Metadata/plate_1.png"
if [ ! -f "$img" ]; then
  rm -rf "$tmpdir"
  exit 1
fi
magick "$img" -thumbnail "${size}x${size}" "$output"
rm -rf "$tmpdir"

exit 0
