export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="personal"
plugins=(
    ls
    git
    zsh-autosuggestions
    golang
    rust
    bun
)
source $ZSH/oh-my-zsh.sh
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

alias cls="clear"
alias pacfzf="pacman -Ss | paste -d '' - - | fzf --multi --preview 'pacman -Si {1}' | cut -d ' ' -f 1 | xargs -ro pacman -Si"
alias nv="nvim"
alias vi="nvim"
alias nvc="z ~/dotfiles/nvim && nvim"
alias py="ipython"
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
export CHROME_EXECUTABLE="google-chrome-canary"

# Created by `pipx` on 2024-03-26 23:29:01
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

[ -s ~/.personal-alias ] && source ~/.personal-alias
[ -s ~/.specific-to-this-device ] && source ~/.specific-to-this-device

alias catat="export DIR=$(pwd -P); cd $HOME/Documents/data-kuliah/ && git add -A && git commit -m 'update' && git push; cd $HOME/Documents/Catatan && git add -A && git commit -m 'update' && git push; cd $DIR"
alias ino="arduino-cli"

export PATH=$PATH:$HOME/.spicetify
export EDITOR=neovide

eval "$(zoxide init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:$HOME/.platformio/penv/bin

alias zshconf="nvim ~/.zshrc && source ~/.zshrc"
alias nvd="neovide & disown && exit"
export PATH=$PATH:/opt/cuda/bin:/home/muhhae/Android/Sdk/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export GRADLE_OPTS="-Dorg.gradle.java.home=$JAVA_HOME"
export PATH=$HOME/Android/Sdk/cmdline-tools/latest/bin:$JAVA_HOME/bin:$PATH

alias reboot-win="sudo bootctl set-oneshot auto-windows && sudo bootctl set-timeout-oneshot 1 && reboot"
alias reboot-arch="sudo bootctl set-oneshot arch && sudo bootctl set-timeout-oneshot 1 && reboot"
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

alias lz=lazygit
export PATH="$PATH:$HOME/personal/research-note"
alias so="source $HOME/.zshrc"
