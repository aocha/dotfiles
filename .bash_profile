if [ -f $HOME/.profile ]; then
  source $HOME/.profile
fi

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

if [ -f $HOME/.bash_local ]; then
  source $HOME/.bash_local
fi
