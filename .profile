export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# @see https://github.com/rbenv/rbenv#how-rbenv-hooks-into-your-shell
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# @see https://github.com/nodenv/nodenv#how-nodenv-hooks-into-your-shell
if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
