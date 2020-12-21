export CLICOLOR=1

#for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

echo hello.

autoload -Uz compinit && compinit  # Gitの補完を有効化
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:*' formats '%u' '%c' '%b'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

precmd () { 
  branch_name=""
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && branch_name="${vcs_info_msg_0_}"
}

text_color='%{\e[38;5;'    # set text color
sharp='\uE0B0'             # triangle
reset='%{\e[0m%}'          # reset
back_color='%{\e[30;48;5;' # set background color
path_t='255m%}'            # path name background color
path_b='025m%}'            # path name text cololr
host_t='172m%}'            # host text cololr
host_b='235m%}'            # host background color

function left-prompt {
  host="${back_color}${host_b}${text_color}${host_t}@%m"
  host_tri="${back_color}${path_b}${text_color}${host_b}${sharp}"
  dir="${back_color}${path_b}${text_color}${path_t}%~"
  dir_tri="${text_color}${path_b}${sharp}"
  branch="${back_color}${branch_b}${text_color}${branch_t}${vcs_info_msg_0_}"
  branch_tri="${text_color}${branch_b}${sharp}"
  echo "${host}${reset}${host_tri}${reset}${dir}${reset}"
}

function rprompt-git-current-branch {
  local st branch_status
  br_clean_b='040m%}'            # branch clean cololr
  br_untracked_b='009m%}'        # branch Untracked cololr
  br_preadd_b='009m%}'           # branch preadd cololr
  br_precommit_b='178m%}'        # branch precommit cololr
  br_conflict_b='057m%}'         # branch conflict cololr
  branch_icon='\uE0A0'

  if test -z $(git rev-parse --git-dir 2> /dev/null); then 
    # not git work tree
    echo "${text_color}${path_b}${sharp}${reset} "
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`

  if [[ -n "$vcs_info_msg_0_" ]]; then
    branch_status="${br_preadd_b}"    # before add
  elif [[ -n "$vcs_info_msg_1_" ]]; then
    branch_status="${br_precommit_b}" # before commit
  elif [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch_status="${br_clean_b}" # conflicted
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    branch_status="${br_conflict_b}" # conflicted
  elif [[ -n `git status 2> /dev/null | grep "^Untracked files"` ]]; then
    branch_status="${br_untracked_b}" # untracked
  else
    branch_status="${br_conflict_b}"  # anything else
  fi
  echo "${back_color}${branch_status}${text_color}${path_b}${sharp}${reset}${back_color}${branch_status}${text_color}${host_b} ${branch_icon}${branch_name}${reset}${back_color}${host_b}${text_color}${branch_status}${sharp} ${reset}"
}
setopt prompt_subst

PROMPT='`left-prompt``rprompt-git-current-branch`'
RPROMPT="%F{white} %D{[%m/%d %H:%M]} %f"

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'

