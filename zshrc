# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/root/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
if [[ -n $SSH_TTY ]]; then
  ZSH_THEME="ys"
else
  ZSH_THEME="ys"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

DISABLE_MAGIC_FUNCTIONS="true"

setopt no_nomatch

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions k)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

zstyle ':completion:*' rehash true

export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR='vim'
export TERM='xterm-256color'

alias vi='vim'
alias pc4="/usr/bin/proxychains4"
alias lsoft="lsof -i -nP -s TCP:ESTABLISHED"

alias ssh-caocz="ssh -p 29840 root@144.34.244.60"
alias ssh-wangqn="ssh -p 23223 root@47.107.87.87"
alias ssh-ali="ssh -p 23223 root@149.129.122.168"
alias ssh-pve05="ssh root@192.168.85.5"

zsh-histdb() {
	# zsh-histdb
	# git clone https://github.com/larkery/zsh-histdb $HOME/.oh-my-zsh/custom/plugins/zsh-histdb
	source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
	autoload -Uz add-zsh-hook
	add-zsh-hook precmd histdb-update-outcome
}

if [[ -x /usr/bin/column ]]; then
	# zsh-histdb
fi

# if [[ -z $STY ]]; then
    # screen -x arch || screen -U -D -R arch
# fi
# if [[ -z $TMUX ]]; then
#     tmux attach-session -t archlinux || tmux new-session -s archlinux
# fi

TS=$(uname -n)
TS_TEST=$(tmux list-sessions | grep "$TS")

create_tmux() {
    tmux new-session -s $TS -n pve05 -d
    tmux new-window -n d1 -t $TS
    tmux new-window -n d2 -t $TS
    tmux new-window -n hkgcp -t $TS
    tmux new-window -n 15 -t $TS
    tmux new-window -n 19 -t $TS
    tmux new-window -n logread -t $TS
    tmux new-window -n pve86 -t $TS
    tmux new-window -n 100 -t $TS
    tmux new-window -n alpine -t $TS
    tmux select-window -t pve05
}

if [[ -z $TS_TEST ]]; then
    create_tmux
fi

if [[ -z $TMUX ]]; then
    tmux attach-session -t $TS -d
fi
