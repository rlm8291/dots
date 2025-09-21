# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=nvim
export EDITOR="$VISUAL"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Setup .local/bin/ for PATH
export PATH="./bin:$HOME/.local/bin:$PATH"

