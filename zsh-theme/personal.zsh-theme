GITSTATUs=$GITSTATUS_PROMPT

PROMPT="%{$fg[blue]%}  %{$fg[cyan]%}%0~%{$reset_color%}"
PROMPT+=' $(git_prompt_info) 
'
PROMPT+="%(?:%{$fg_bold[blue]%}%1{󱞩%} :%{$fg_bold[red]%}%1{󱞩%} ) "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} (%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}%1{%}"
