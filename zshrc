autoload colors;colors
#export CLICOLOR=1

function sharp {
  echo "\uE0B0"
}
function branch {
  echo "\uE0A0"
}

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u`branch`%b%f "
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){ vcs_info }

PROMPT='%{$fg[white]$bg[blue]%}%m@%n${reset_color}%{$fg[blue]$bg[yellow]%}`sharp`%{$fg[black]$bg[yellow]%}%~%{$fg[yellow]$bg[black]%}`sharp`${reset_color} ${vcs_info_msg_0_}' 

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

