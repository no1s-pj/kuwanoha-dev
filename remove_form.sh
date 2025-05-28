#!/bin/bash

# echo "マッチした内容を表示します："
# find . -type f -name "*.html" | while read -r file; do
#   perl -0777 -ne '
#    while (/<form\b[^>]*?action="https:\/\/kuwanoha\.com\/cart\/add"[^>]*?>.*?<\/form>/sg) {
#      print "=== $ARGV ===\n";
#      print "$&\n\n";
#    }
#  ' "$file"
#done



# HTMLファイルを再帰的に探す（拡張子 .html に限定）
find . -type f -name "*.html" | while read -r file; do
  echo "Processing $file"

  # Perlで<form ... action="https://kuwanoha.com/cart/add"> ... </form>を削除
  perl -0777 -i -pe '
    s{<form\b[^>]*?action="https://kuwanoha\.com/cart/add"[^>]*?>.*?</form>}{}gs
  ' "$file"
done


