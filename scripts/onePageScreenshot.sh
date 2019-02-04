
# wkhtmltoimage --height <height> --width <width> --filename="<name>" <url>
# <url> = http://localhost/prlg_styles/templates/<name>

# View ports [360x640, 768x1204, 600x960]
# Iphone [320x568 - 414x896]
# iPad [768x1024 - 1024x1366]
# Android [360x740 - 480x853]
# Android tablet [600x960 - 800x1280 - 1280x850]
## Remove old stuff

if [ $# -eq 0 ]
  then
    echo "No arguments. Nothing to do"
fi
out="./output/singlepage"
`rm -rf $out`
`mkdir -p $out`
name="$1"

localhostUrl="http://localhost/prlg_styles/templates/"
wkhtmltoimage --height 800 --width 414 "$localhostUrl$name.html" "$out/phone.jpg"
wkhtmltoimage --height 800 --width 768 "$localhostUrl$name.html" "$out/tablet.jpg"
wkhtmltoimage --height 800 --width 1200 "$localhostUrl$name.html" "$out/web.jpg"

`convert -density 300 -quality 100 $out/phone.jpg $out/tablet.jpg $out/web.jpg output/$name.pdf`
