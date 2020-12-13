export CLICOLOR=1

#for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

echo hello.

autoload -Uz compinit && compinit  # Gitの補完を有効化

text_color='%{\e[38;5;'    # set text color
sharp='\uE0B0'             # triangle
reset='%{\e[0m%}'          # reset
back_color='%{\e[30;48;5;' # set background color
path_t='000m%}'            # path name background color
path_b='032m%}'            # path name text cololr
host_t='032m%}'            # host text cololr
host_b='236m%}'            # host background color

function left-prompt {
  host="${back_color}${host_b}${text_color}${host_t}@%m"
  host_tri="${back_color}${path_b}${text_color}${host_b}${sharp}"
  dir="${back_color}${path_b}${text_color}${path_t}%~"
  dir_tri="${text_color}${path_b}${sharp}"
  branch="${back_color}${branch_b}${text_color}${branch_t}${vcs_info_msg_0_}"
  branch_tri="${text_color}${branch_b}${sharp}"
  echo "${host}${reset}${host_tri}${reset}${dir}${reset}"
}

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status
  br_clean_b='040m%}'            # branch clean cololr
  br_untracked_b='009m%}'        # branch Untracked cololr
  br_preadd_b='009m%}'           # branch preadd cololr
  br_precommit_b='178m%}'        # branch precommit cololr
  br_conflict_b='057m%}'         # branch conflict cololr
  branch_icon='\uE0A0'

  if [ ! -e  ".git" ]; then
    # not git work tree
    echo "${text_color}${path_b}${sharp} ${reset}"
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch_status="${br_clean_b}"     # clean
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    branch_status="${br_untracked_b}" # untracked
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    branch_status="${br_preadd_b}"    # before add
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    branch_status="${br_precommit_b}" # before commit
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    branch_status="${br_conflict_b}"  # conflicted
  else
    branch_status="${br_conflict_b}"  # anything else
  fi
  echo "${back_color}${branch_status}${text_color}${path_b}${sharp}${reset}${back_color}${branch_status}${text_color}${host_b} ${branch_icon}${branch_name}${reset}${back_color}${host_b}${text_color}${branch_status}${sharp} ${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
#setopt prompt_subst

PROMPT='`left-prompt``rprompt-git-current-branch`'
RPROMPT="%F{white} %D{[%m/%d %H:%M]} %f"

export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'

