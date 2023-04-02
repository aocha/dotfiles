#!/usr/bin/env bash

echo "[info] Start install Homebrew..."
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "[info] Finish install Homebrew."
else
  echo "[info] Homebrew is already installed."
fi

brew install rbenv
