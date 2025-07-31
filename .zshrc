# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# From - https://kubernetes.io/docs/tasks/tools/install-kubectl/
# From - https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories
# May need to run: compaudit | xargs chmod g-w

autoload -Uz compinit
compinit

source <(kubectl completion zsh)

# From - https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000

setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

setopt AUTO_CD
#setopt CORRECT
#setopt CORRECT_ALL

alias ll='ls -lGart'
alias ls='ls -G'
alias k='kubectl'
#complete -F __start_kubectl k
alias python=$(which python3)

export HOMEBREW_NO_AUTO_UPDATE=1
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Advanced auto-completion
# autoload -Uz compinit && compinit

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/smithbaud/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export PATH=$PATH:"/Users/smithbaud/bin"
