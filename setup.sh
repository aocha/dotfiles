#!/usr/bin/env bash
set -eu

echo '[INFO] check brew command ...'
if type brew > /dev/null 2>&1; then
  echo '[INFO] already installed homebrew.'
else
  echo '[INFO] install homebrew ...'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

declare -ar FORMULAE=(
  'bash'
  'ghq'
  'git'
  'nodenv'
  'peco'
  'pyenv'
  'rbenv'
  'tig'
  'the_silver_searcher'
  'tmux'
  'yarn'
)
declare -a MISSING_FORMULAE=()

echo '[INFO] check missing formula ...'
for formula in ${FORMULAE[*]}
do
  if [ -z $(brew list | grep -E "^${formula}$") ]; then
    MISSING_FORMULAE+=($formula)
  fi
done

if [ -z ${MISSING_FORMULAE[*]:-} ]; then
  echo '[INFO] already installed formulae.'
else
  echo '[INFO] install missing formulae ...'
  brew install ${MISSING_FORMULAE[*]}
fi

echo '[INFO] create symbolic link ...'
for file in .??*
do
  if [ $file = ".git" ]; then
    continue
  fi

  if ln -fns $PWD/$file $HOME/$file; then
    echo "  linked file : ${PWD}/${file} -> ${HOME}/${file}"
  fi
done

echo '[INFO] relogin shell.'
exec -l $SHELL
