
# wkhtmltoimage --height <height> --width <width> --filename="<name>" <url>
# <url> = http://localhost/prlg_styles/templates/<name>

# View ports [360x640, 768x1204, 600x960]
# Iphone [320x568 - 414x896]
# iPad [768x1024 - 1024x1366]
# Android [360x740 - 480x853]
# Android tablet [600x960 - 800x1280 - 1280x850]
## Remove old stuff
rm -rf output/*
mkdir output/phone
mkdir output/tablet
mkdir output/web
concatenate=""
## Iterate
for f in ./templates/*.html; do
  # do some stuff with $f
  name_html="$(cut -d'/' -f3 <<<"$f")"
  name="$(cut -d'.' -f1 <<<"$name_html")"
  wkhtmltoimage --height 800 --width 414 "http://localhost/prlg_styles/templates/$name.html" "output/phone/$name.jpg"
  # 768 is the first tablet value (or md) according to bootstrap
  wkhtmltoimage --height 800 --width 768 "http://localhost/prlg_styles/templates/$name.html" "output/tablet/$name.jpg"
  wkhtmltoimage --height 800 --width 1200 "http://localhost/prlg_styles/templates/$name.html" "output/web/$name.jpg"
  echo $name
  concatenate="$concatenate ./$name.jpg"
done
#pwd
cd output/phone
`convert -density 300 -quality 100 $concatenate ../phone.pdf`
cd ../tablet
`convert -density 300 -quality 100 $concatenate ../tablet.pdf`
cd ../web
`convert -density 300 -quality 100 $concatenate ../web.pdf`
cd ../
convert -density 300 -quality 100 phone.pdf tablet.pdf web.pdf merge.pdf