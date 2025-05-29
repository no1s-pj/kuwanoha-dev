#!/bin/bash

#echo "マッチした <section> ブロックのあるファイルと内容："

#find . -type f -name "*.html" | while read -r file; do
#  perl -0777 -ne '
#    while (/<section\b[^>]*?class="[^"]*section-product bg-green[^"]*"[^>]*?>[\s\S]*?<\/section>/g) {
#      print "=== $ARGV ===\n";
#      print "$&\n\n";
#    }
#  ' "$file"
#done



#!/bin/bash

echo "以下のファイルから <section class=\"section-product bg-green\"> を削除します："

find . -type f -name "*.html" | while read -r file; do
  perl -0777 -i -pe '
    s{<section\b[^>]*?class="[^"]*section-product bg-green[^"]*"[^>]*?>[\s\S]*?<\/section>}{}g
  ' "$file" && echo "✔ Updated: $file"
done
