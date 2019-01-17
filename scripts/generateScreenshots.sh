
# wkhtmltoimage --height <height> --width <width> --filename="<name>" <url>
# <url> = http://localhost/prlg_styles/templates/<name>

#rm output/*
concatenate=""
for f in ./templates/*.html; do
  # do some stuff with $f
  name_html="$(cut -d'/' -f3 <<<"$f")"
  name="$(cut -d'.' -f1 <<<"$name_html")"
  #wkhtmltoimage --height 1200 --width 450 "http://localhost/prlg_styles/templates/$name.html" "output/$name.jpg"
  echo $name
  concatenate="$concatenate ./output/$name.jpg"
done
#pwd
`convert $concatenate ./output/merged.pdf`