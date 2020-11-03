http://blog.aqutras.com/entry/2016/07/11/210000

autoload -Uz vcs_info
setopt prompt_subst
autoload colors;colors

export CLICOLOR=1

function sharp {
  echo "\uE0B0"
}

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

PROMPT='%{$fg[white]$bg[blue]%}%m@%n${reset_color}%{$fg[blue]$bg[yellow]%}`sharp`%{$fg[black]$bg[yellow]%}%~%{$fg[yellow]$bg[black]%}`sharp`${reset_color} ${vcs_info_msg_0_} '
precmd(){ vcs_info }

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

