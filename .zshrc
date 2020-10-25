# git �u�����`����F�t���ŕ\�������郁�\�b�h
function rprompt-git-current-branch {
  local branch_name st branch_status
 
  if [ ! -e  ".git" ]; then
    # git �Ǘ�����Ă��Ȃ��f�B���N�g���͉����Ԃ��Ȃ�
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # �S�� commit ����ăN���[���ȏ��
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git �Ǘ�����Ă��Ȃ��t�@�C����������
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add ����Ă��Ȃ��t�@�C����������
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit ����Ă��Ȃ��t�@�C����������
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # �R���t���N�g���N���������
    echo "%F{red}!(no branch)"
    return
  else
    # ��L�ȊO�̏�Ԃ̏ꍇ
    branch_status="%F{blue}"
  fi
  # �u�����`����F�t���ŕ\������
  echo "${branch_status}[$branch_name]"
}
 
# �v�����v�g���\������邽�тɃv�����v�g�������]���A�u������
setopt prompt_subst
 
# git �u�����`����F�t���ŕ\�������郁�\�b�h
function rprompt-git-current-branch {
  local branch_name st branch_status
  
  branch='\ue0a0'
  color='%{\e[38;5;' #  �����F��ݒ�
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset
  
  if [ ! -e  ".git" ]; then
    # git �Ǘ�����Ă��Ȃ��f�B���N�g���͉����Ԃ��Ȃ�
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # �S�� commit ����ăN���[���ȏ��
    branch_status="${color}${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git �Ǘ�����Ă��Ȃ��t�@�C����������
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add ����Ă��Ȃ��t�@�C����������
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit ����Ă��Ȃ��t�@�C����������
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # �R���t���N�g���N���������
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  else
    # ��L�ȊO�̏�Ԃ̏ꍇ
    branch_status="${color}${blue}${branch}"
  fi
  # �u�����`����F�t���ŕ\������
  echo "${branch_status}$branch_name${reset}"
}
 
# �v�����v�g���\������邽�тɃv�����v�g�������]���A�u������
setopt prompt_subst
 
# �v�����v�g�̉E���Ƀ��\�b�h�̌��ʂ�\��������
RPROMPT='`rprompt-git-current-branch`'
