# install CascadiaCodePL.ttf
# https://tomiylab.com/2020/03/prompt/
export CLICOLOR=1

#for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

echo hello.

autoload -Uz compinit && compinit  # Gitの補完を有効化

function branch_icon {
  echo '\uE0A0'
}

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}%B!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}%B+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(`branch_icon` %b)%f "
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

function left-prompt {
  host_b='031m%}'            # host background color
  host_t='236m%}'            # host text cololr
  path_b='179m%}'            # path name text cololr
  path_t='236m%}'            # path name background color
  back_color='%{\e[30;48;5;' # set background color
  text_color='%{\e[38;5;'    # set text color
  reset='%{\e[0m%}'          # reset
  sharp='\uE0B0'             # triangle
  
  host="${back_color}${host_b}${text_color}${host_t}@%m"
  host_tri="${back_color}${path_b}${text_color}${host_b}${sharp}"
  dir="${back_color}${path_b}${text_color}${path_t}%~"
  dir_tri="${text_color}${path_b}${sharp}"
  branch="${back_color}${branch_b}${text_color}${branch_t}${vcs_info_msg_0_}"
  branch_tri="${text_color}${branch_b}${sharp}"
#  echo "${host}@%m ${back_color}${name_t}${text_color}${path_b}${sharp} ${dir}%~ ${reset}${text_color}${name_t}${sharp}${reset}"
#  echo "${host} ${reset}${host_tri} ${reset}${dir} ${reset}${dir_tri} ${reset}${branch}${reset}${branch_tri}"
#  echo "${host} ${reset}${host_tri} ${reset}${dir} ${reset}${dir_tri} ${reset}${vcs_info_msg_0_}"
  echo "${host} ${reset}${host_tri} ${reset}${dir} ${reset}${dir_tri}${reset}"
}

function branch_status {
  echo '${vcs_info_msg_0_}'
}

PROMPT=`left-prompt``branch_status`
#PROMPT=`left-prompt`
RPROMPT="%F{white} %D{[%m/%d %H:%M]} %f"
setopt prompt_subst

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'

