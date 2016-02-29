# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=/opt/local/bin:/opt/local/sbin:/opt/oracle/ohome/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# export MANPATH="/usr/local/man:$MANPATH"

export JAVA_HOME=`/usr/libexec/java_home`
#export JAVA_HOME_VENDAVO=`/usr/libexec/java_home -v 1.6`
export JAVA_HOME_VENDAVO=$JAVA_HOME

DYLD_LIBRARY_PATH=/opt/oracle/ohome/lib
SQLPATH=/opt/oracle/ohome
ORACLE_HOME=/opt/oracle/ohome
export DYLD_LIBRARY_PATH
export SQLPATH
export ORACLE_HOME
export PATH=$ORACLE_HOME/bin:$PATH
#export LC_ALL=en_US.utf-8

LC_ALL=en_US.utf-8
LANG=en_US.utf-8
export LC_ALL
export LANG

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# coreutils aliases
alias realpath=grealpath

# redirecting vim to macvim terminal app
mvimlink=$(greadlink -f $(which mvim))
mvimdir=$(realpath $(dirname $mvimlink)/..)
alias vim=$mvimdir/MacVim.app/Contents/MacOS/Vim
export PATH=$mvimdir/MacVim.app/Contents/MacOS:$PATH

# emacs
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

# git aliases
alias gf='git fetch'
alias gr='git rebase'
alias st='git stash'
alias pop='git stash pop'
alias gmt='git mergetool'

# ven aliases
export VEN_3RDPARTY_HOME=~/git/3rdparty

v() { ./v $* && terminal-notifier -message "Operation $* DONE." -title "Vendavo" && say nechum and makay }
alias vut='v run-realjunit skipTests=false'
alias d1='v dev1'
alias d1n='v dev1-noschema'
alias d2='v dev2'
