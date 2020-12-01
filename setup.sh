#!/usr/bin/env bash

set -eu

declare -ar HOMEBREW_PACKAGES=(
  "bash"
  "ghq"
  "git"
  "jq"
  "nodenv"
  "peco"
  "rbenv"
  "tig"
  "tmux"
  "yarn"
)

function install_homebrew_if_needed() {
  echo "[info] Checking Homebrew..."
  if type /usr/local/bin/brew > /dev/null 2>&1; then
    echo "[info] Alreday installed."
  else
    echo "[info] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function update_homebrew_and_packages() {
  echo "[info] Updating Homebrew and packages..."
  /usr/local/bin/brew upgrade
}

function install_packages_via_homebrew() {
  echo "[info] Installing packages via Homebrew..."
  /usr/local/bin/brew install ${HOMEBREW_PACKAGES[*]}
}

function link_files() {
  echo "[info] Creating symbolic link files..."
  for file in .??*
  do
    if [ $file = '.git' ]; then
      continue
    fi
    if [ $file = '.gitignore' ]; then
      continue
    fi

    if ln -fns $PWD/$file $HOME/$file; then
      echo "  ${PWD}/${file} → ${HOME}/${file}"
    fi
  done
}

install_homebrew_if_needed
update_homebrew_and_packages
install_packages_via_homebrew
link_files

echo "[info] Setup completed!!"
