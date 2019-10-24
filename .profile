# @see https://golang.org/doc/install#tarball
if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
fi

# @see https://github.com/rbenv/rbenv#how-rbenv-hooks-into-your-shell
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
