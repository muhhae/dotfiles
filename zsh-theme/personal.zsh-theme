# GITSTATUS=$GITSTATUS_PROMPT

PROMPT="%(!.%{$fg[red]%}[root] .)%{$fg[blue]%}  %0~%{$reset_color%}"
PROMPT+=' $(git_prompt_info)$(git_prompt_status) 
'
PROMPT+="%(?:%{$fg_bold[blue]%}%1{%} :%{$fg_bold[red]%}%1{%} ) "
zle_highlight=( default:fg=cyan )

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%} (%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})" 
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ADDED"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} MODIFIED"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} DELETED"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} RENAMED"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} UNMERGED"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} UNTRACKED"
