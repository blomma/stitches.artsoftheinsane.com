# Stitches website

Landing page and privacy policy for Stitches on iPhone, iPad and Mac.

## Build

```sh
npm ci
npm run build
```

The production files are in `docs/`. Run `npm run dev` to preview the source locally.

The social preview image comes from `sh scripts/generate-og-image.sh` (ImageMagick). Rebuild after changing it.

## Screenshots

`public/shot-*.webp` are made from the raw captures in `../Stitches`, using `cwebp` and ImageMagick. Rebuild afterwards.

```sh
raw=../Stitches/screenshots/raw

for shot in decreases:01_Decreases rearrange:02_Rearrange increases:03_Increases \
  round:04_RowOrRound pattern:05_Pattern library:07_Library; do
  cwebp -q 90 -resize 640 1391 "$raw/iPhone/${shot#*:}.png" -o "public/shot-${shot%:*}.webp"
done
```

The Mac capture needs more: it's Display P3, which `cwebp` would misread, and has the desktop in its corners. So it's converted to sRGB and takes its transparent corners from the current shot, which the page's drop shadow depends on.

```sh
magick public/shot-mac-library.webp -alpha extract mask.png
magick "$raw/Mac/07_Library.png" -alpha off \
  -profile "/System/Library/ColorSync/Profiles/sRGB Profile.icc" \
  -resize '1600x1000!' -strip mask.png -compose CopyOpacity -composite mac.png
cwebp -q 90 mac.png -o public/shot-mac-library.webp
rm mask.png mac.png
```
