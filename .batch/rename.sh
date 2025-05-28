# cd kuwanoha.com/s/files/1/0468/6669/4306/files/
# cd kuwanoha.com/cdn/shop/products/
#cd kuwanoha.com/cdn/shop/articles/
cd ../s/files/1/0468/6669/4306/products/

for f in *\?v=*; do
  # 「?v=以下」を取り除いた部分を new に格納
  new="${f%%\?v=*}"
  # リネーム実行
  mv -- "$f" "$new"
done

