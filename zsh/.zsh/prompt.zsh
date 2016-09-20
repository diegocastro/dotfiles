autoload colors && colors

function git_dirty() {
	if $(! command git status -s &> /dev/null)
	then
		echo ""
	else
		if [[ $(command git status --porcelain) == "" ]]
		then
			echo "%{$fg_bold[yellow]%}‹$(git_prompt_info)› %{$reset_color%}"
		else
			echo "%{$fg_bold[red]%}‹$(git_prompt_info)› %{$reset_color%}"
		fi
	fi
}

function git_prompt_info() {
	ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

	echo "${ref#refs/heads/}"
}

if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg_bold[white]%}%n@%m%{$reset_color%} %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[green]}%}%3~ $(git_dirty)%{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '

RPS1="${return_code}"
