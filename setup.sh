#!/usr/bin/env bash

set -eu

declare -ar HOMEBREW_PACKAGES=(
  "bash"
  "ghq"
  "git"
  "htop"
  "jq"
  "nodenv"
  "peco"
  "rbenv"
  "tig"
  "tmux"
  "yarn"
)

function print_notice() {
  echo -e "\e[37;1m[notice]\e[m ${1}"
}

function print_info() {
  echo -e "\e[33;1m[info]\e[m ${1}"
}

function print_success() {
  echo -e "\e[32;1m[success]\e[m ${1}"
}

function print_error() {
  echo -e "\e[31;1m[error]\e[m ${1}"
}

function install_homebrew_if_needed() {
  print_notice "Checking homebrew..."
  if type /usr/local/bin/brew > /dev/null 2>&1; then
    print_info "homeberw is alreday installed."
  else
    print_notice "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "homebrew installed successfully."
  fi
}

function update_homebrew_and_packages() {
  print_notice "Updating homebrew and packages..."
  /usr/local/bin/brew upgrade
  print_success "homebrew and packages updated successfully."
}

function install_missing_packages_via_homebrew() {
  print_notice "Installing missing packages via homebrew..."
  for package in ${HOMEBREW_PACKAGES[*]}; do
    brew list | grep $package > /dev/null
    if [ $? -eq 0 ]; then
      print_info "\e[34;1m${package}\e[m is already installed."
    else
      /usr/local/bin/brew install $package
      print_success "\e[34;1m${package}\e[m installed successfully."
    fi
  done
}

function link_files() {
  print_notice "Creating symbolic link files..."
  for file in .??*
  do
    if [ $file = '.git' ]; then
      continue
    fi
    if [ $file = '.gitignore' ]; then
      continue
    fi

    if ln -fns $PWD/$file $HOME/$file; then
      echo -e "  \e[37m${PWD}/${file} -> ${HOME}/${file}\e[m"
    fi
  done
}

install_homebrew_if_needed
update_homebrew_and_packages
install_missing_packages_via_homebrew
link_files

print_notice "Setup completed!!"
