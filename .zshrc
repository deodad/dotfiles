# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  docker-compose
  git
  fzf
)

# auto-update, dont bug me
DISABLE_UPDATE_PROMPT=true

source $ZSH/oh-my-zsh.sh
fpath+=~/.zfunc

# Plugin configuration
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# User configuration
autoload -U compinit
compinit -i

export EDITOR="nvim"
export VISUAL="nvim"

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'vv' edit-command-line

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Enable vi mode
bindkey -v

# no beep
unsetopt BEEP

zstyle ':urlglobber' url-other-schema

alias v="nvim"
alias ls="lsd"
alias ezsh="source ~/.zshrc"
alias szsh="source ~/.zshrc"
alias ..="cd .."
alias ...="cd .."

# dotfiles
alias config='/usr/bin/git --git-dir=/Users/deodad/.cfg/ --work-tree=/Users/deodad'

# tmux
alias ta='tmux attach'
alias td='tmux detach'

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# git
alias g='git' 
alias ga='git add .'
alias gc='git commit'
alias gc!='git commit --amend'
alias gca='git commit --all'
alias gca!='git commit --all --amend'
alias gca!!='git commit --all --amend --no-edit'
alias gs='git status'
alias branches='git branch --sort=-committerdate'
alias gb='git branch'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout main'
alias gg='git switch -'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbm='git rebase main'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gt='git trim'
alias lg='lazygit'

# mobile dev
alias dl='xcrun simctl openurl booted'
alias dla='adb shell am start -a android.intent.action.VIEW -d'

# android studio
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# foundry
export PATH="$PATH:/Users/deodad/.foundry/bin"
autoload -U compinit
compinit -i

# rust
source $HOME/.cargo/env

# ruby version manager
eval "$(frum init)" 

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias y="yarn"
alias ya="yarn add"
alias yad="yarn add --dev"

# fnm
export PATH="/Users/deodad/Library/Application Support/fnm:$PATH"
eval "`fnm env --use-on-cd --shell zsh`"

# aws
[[ -r '/opt/homebrew/opt/awscli/libexec/bin/aws_zsh_completer.sh' ]] && source '/opt/homebrew/opt/awscli/libexec/bin/aws_zsh_completer.sh' 

# google cloud
if [ -f '/Users/deodad/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/deodad/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/deodad/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/deodad/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun
[ -s "/Users/deodad/.bun/_bun" ] && source "/Users/deodad/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
