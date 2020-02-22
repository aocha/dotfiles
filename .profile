export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

# @see https://golang.org/doc/install#tarball
if [ -d /usr/local/go/bin ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:/usr/local/go/bin
  export PATH=$PATH:$GOPATH/bin
fi

# @see https://github.com/rbenv/rbenv#how-rbenv-hooks-into-your-shell
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# @see https://github.com/nodenv/nodenv#how-nodenv-hooks-into-your-shell
if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# @see https://github.com/pyenv/pyenv#advanced-configuration
if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# @see https://github.com/direnv/direnv/blob/master/docs/hook.md
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi
