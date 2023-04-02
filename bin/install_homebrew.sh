#!/usr/bin/env bash

echo "[info] Start install Homebrew..."
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "[info] Finish install Homebrew."
else
  echo "[info] Homebrew is already installed."
fi

echo "[info] Start install formulas..."
formulas=(rbenv tig tree)
for formula in "${formulas[@]}"
do
  echo "[info] Start install $formula..."
  if ! brew list "$formula" >/dev/null 2>&1; then
    brew install "$formula"
    echo "[info] Finish install $formula."
  else
    echo "[info] $formula is already installed."
  fi
done
echo "[info] Finish install formulas."
