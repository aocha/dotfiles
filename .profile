export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix openssl)/lib"
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
