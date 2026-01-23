export ZSH="$HOME/.oh-my-zsh"

plugins=(
    git
    sudo
    zsh-interactive-cd
    bgnotify
    command-not-found
    eza
    fzf
    gh
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf-tab
)

zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'header' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'size-prefix' binary
# zstyle ':omz:plugins:eza' 'hyperlink' yes

source $ZSH/oh-my-zsh.sh



ZSH_THEME="personal"

alias zshconf="nvim ~/.config/zsh/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

alias cls="clear"
nv() {
    if [[ "$TERM" = "xterm-kitty" ]]; then
        kitty @ set-spacing padding=0;
        nvim "$@";
        kitty @ set-spacing padding=default
    else
        nvim "$@";
    fi
}
pt() {
    kitty @ set-spacing padding=0;presenterm "$@";kitty @ set-spacing padding=default
}
alias vi="nvim"
alias nvc="z ~/dotfiles/nvim && nvim"
alias py="python3"
alias check_power="while true; do cat /sys/class/power_supply/ADP1/online && sleep 1; done"
alias g++="g++ -std=c++17"
alias pgstrt="\
    d=$(pwd)\
    z personal\
    echo $(pwd)\
    z $d\
    echo $(pwd)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Turso
export PATH="$HOME/.turso:$PATH"

# export CHROME_EXECUTABLE="firefox"
export CHROME_EXECUTABLE="google-chrome"

# Created by `pipx` on 2024-03-26 23:29:01
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

[ -s ~/.personal-alias ] && source ~/.personal-alias
[ -s ~/.specific-to-this-device ] && source ~/.specific-to-this-device

alias catat="export DIR=$(pwd -P); cd $HOME/Documents/data-kuliah/ && git add -A && git commit -m 'update' && git push; cd $HOME/Documents/Catatan && git add -A && git commit -m 'update' && git push; cd $DIR"
alias ino="arduino-cli"

export PATH=$PATH:$HOME/.spicetify
export EDITOR=nvim

eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$HOME/.platformio/penv/bin

nvd() {
    (neovide $1 && kitty --directory "$pwd") & disown
    exit
}

export PATH=$PATH:/opt/cuda/bin

alias reboot-win="sudo bootctl set-oneshot auto-windows && sudo bootctl set-timeout-oneshot 1 && reboot"
alias autotex="latexmk -pdf -pvc -interaction=nonstopmode -f"
alias lg="lazygit"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# oh-my-logo "I USE\nARCH\nBTW!" --filled
# oh-my-logo "ARCHNEMESIS" --filled

alias lz=lazygit
export PATH="$PATH:$HOME/personal/research-note:$HOME/dotfiles/scripts"
alias so="source ~/.config/zsh/.zshrc"
alias pm="pm.sh"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"
alias nvchad="NVIM_APPNAME=NvChad nvim"
alias fix-lock="hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1' && hyprctl --instance 0 'dispatch exec hyprlock' && chvt 1"


alias zz="z -"
export _ZO_ECHO=0

calc() {
    set -f
    python -c "print($*)"
    set +f
}
alias plasma="dbus-run-session startplasma-wayland -- --display=:1"
eval "$(fzf --zsh)"

autoload -Uz add-zsh-hook

load_fzf_keybindings() {
  if [[ $- == *i* ]] && [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
    # Optional: rebind Ctrl-R in case zle wasn't ready
    bindkey '^R' fzf-history-widget
  fi
}

add-zsh-hook -Uz precmd load_fzf_keybindings
setopt EXTENDED_HISTORY

HISTSIZE=1000000
SAVEHIST=1000000

alias cmd="cmd.sh"

timem() {
    { /usr/bin/time -f "%M" "$@" ; } 2>&1 | awk 'END{print $1/1024 " MB"}'
}

alias note="cd ~/personal/research-note && glow ."
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export QT_QPA_PLATFORM=xcb

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

source ~/.secret

eval "$(starship init zsh)"


