# install CascadiaCodePL.ttf
# https://tomiylab.com/2020/03/prompt/
export CLICOLOR=1

echo hello.

autoload -Uz compinit && compinit  # Gitの補完を有効化

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f "
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

function left-prompt {
  name_t='178m%}'            # user name text clolr
  name_b='236m%}'            # user name background color
  path_t='255m%}'            # path text clolr
  path_b='031m%}'            # path background color
  text_color='%{\e[38;5;'    # set text color
  back_color='%{\e[30;48;5;' # set background color
  reset='%{\e[0m%}'          # reset
  sharp='\uE0B0'             # triangle
  
  user="${back_color}${name_b}${text_color}${name_t}"
  dir="${back_color}${path_b}${text_color}${path_t}"
  echo "${user}@%m${back_color}${path_b}${text_color}${name_b}${sharp} ${dir}%~${reset}${text_color}${path_b}${sharp}${reset}"
}

function branch_status {
  echo '${vcs_info_msg_0_}'
}

PROMPT=`left-prompt``branch_status`
setopt prompt_subst
 
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'

