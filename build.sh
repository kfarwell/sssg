#!/bin/sh
for i in *.md; do
    file=$(echo "$i" | cut -f1 -d.).html
    cat head.html > $file
    md2html.awk "$i" >> $file
    cat foot.html >> $file
done

cat head.html > gallery/index.html
for i in $(ls -r gallery/*.jpg); do
    echo '<img src="'$(basename "$i")'" />' >> gallery/index.html
done
cat foot.html >> gallery/index.html
