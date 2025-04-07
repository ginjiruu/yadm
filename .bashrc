#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} && ${SHLVL} == 1 ]]; then
	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
	exec fish $LOGIN_OPTION
fi

export PATH="/usr/local/bin/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
[[ -s "/home/ginjiruu/.gvm/scripts/gvm" ]] && source "/home/ginjiruu/.gvm/scripts/gvm"
