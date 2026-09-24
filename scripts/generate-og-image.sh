#!/bin/sh
set -eu

cd "$(dirname "$0")/.."

magick -size 1200x630 xc:'#fbf5e9' \
  -fill '#f4dce1' -draw 'circle 1010,315 1010,5' \
  -fill '#efdcc6' -draw 'circle 1120,500 1120,305' \
  -font '/System/Library/Fonts/Supplemental/Arial Bold.ttf' \
  -fill '#b73958' -pointsize 29 -annotate +76+106 'STITCHES' \
  -fill '#283d45' -pointsize 67 \
  -annotate +76+226 'Plan your increases' \
  -annotate +76+310 'and decreases.' \
  -font '/System/Library/Fonts/Supplemental/Arial.ttf' \
  -fill '#617078' -pointsize 30 \
  -annotate +76+385 'See the spacing across a row or round.' \
  -annotate +76+430 'Knit from a clear instruction.' \
  \( public/icon.png -resize 282x282 \) -geometry +845+170 -composite \
  public/og-image.png
