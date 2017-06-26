# git status
COLOR_RED="\033[01;31m"
COLOR_YELLOW="\033[01;33m"
COLOR_GREEN="\033[01;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[01;34m"
COLOR_WHITE="\033[01;37m"
COLOR_RESET="\033[0m"

function git_color {
    local git_status="$(git status 2> /dev/null)"

    if [[ ! $git_status =~ "working directory clean" ]]; then
        echo -e $COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        echo -e $COLOR_YELLOW
    elif [[ $git_status =~ "nothing to commit" ]]; then
        echo -e $COLOR_RESET
    else
        echo -e $COLOR_RESET
    fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

# Virtualenv prompt
function virtualenv_info {
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        echo -e "\033[30;43m venv:${VIRTUAL_ENV##*/} \033[33;41m\xee\x82\xb0"
    fi
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

PS1=$'\n$(virtualenv_info)${debian_chroot:+($debian_chroot)}\[\033[30;41m\] \u:\h \[\033[31;46m\]\xee\x82\xb0\[\033[30;46m\] \w \[\033[36;49m\]\xee\x82\xb0 \[$(git_color)\]$(git_branch)\n\[\033[31m\]\xe2\x80\xa2\[\033[35m\]\xe2\x80\xa2\[\033[34m\]\xe2\x80\xa2 \[\033[00m\]'
