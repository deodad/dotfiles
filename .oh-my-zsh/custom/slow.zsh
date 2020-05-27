function _setup_conda() {
  unset -f conda

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/home/dad/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/home/dad/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/home/dad/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/home/dad/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}

function conda() {
  _setup_conda conda "$@"
}

function _setup_rvm() {
  unset -f rvm ruby bundle
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
  "$@"
}

function rvm() {
  _setup_rvm rvm "$@"
}

function ruby() {
  _setup_rvm ruby "$@"
}

function bundle() {
  _setup_rvm bundle "$@"
}

function _setup_nvm() {
  unset -f nvm
  
  # Set up "nvm" could use "--no-use" to defer setup, but we are here to use it
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This sets up nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # nvm bash_completion
  "$@"
}

function nvm() {
  _setup_nvm nvm "$@"
}

# function npm() {
#   _setup_nvm npm "$@"
# }

# function node() {
#   _setup_nvm node "$@"
# }

# function _setup_yvm() {
#   unset -f yvm
#   export YVM_DIR="$HOME/.yvm"
#   [ -s $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
#   "$@"
# }

# function yvm() {
#   _setup_yvm yvm "$@"
# }
