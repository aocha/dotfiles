#!/usr/bin/env bash

echo "[info] Start symlink..."
for dir in .??*; do
  if [ "$dir" = ".git" ]; then
    continue
  fi
  
  for file in "$dir"/.??*; do
    filename=$(basename "$file")
    source_file=$PWD/$file
    target_file=$HOME/$filename

    ln -sf "$source_file" "$target_file"
    echo "[info]   from $source_file to $target_file"
  done
done
echo "[info] Finish symlink."
