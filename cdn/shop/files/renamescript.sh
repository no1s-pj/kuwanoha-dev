#!/bin/bash

echo "処理を開始します..."

# スクリプトがあるディレクトリ内の '?' を含むファイルを検索
# ファイル名にスペースが含まれていても正しく動作するように設定
IFS=$'\n'

for oldName in ./*\?*; do
    # マッチするファイルがない場合のエラーを回避
    [ -f "$oldName" ] || continue

    # '?' を区切り文字として、それより前の部分を新しいファイル名として取得
    # ${変数名%%パターン} という書式で、変数後方から最長一致したパターンを削除
    newName="${oldName%%\?*}"

    # ファイル名が変更される場合のみリネームを実行
    if [ "$oldName" != "$newName" ]; then
        # もし新しいファイル名が既に存在していたら、上書きせずにエラーを表示
        if [ -e "$newName" ]; then
            echo "エラー: 「$newName」は既に存在するため、「$oldName」をリネームできませんでした。"
        else
            echo "「$oldName」を「$newName」に変更します。"
            # mvコマンドでファイル名を変更
            mv -- "$oldName" "$newName"
        fi
    fi
done

echo "処理が完了しました。"
