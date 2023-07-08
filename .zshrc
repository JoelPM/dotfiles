## If not running interactively, do nothing 
[ -z "$PS1" ] && return

<<<<<<< HEAD
###################
# History
###################
=======
source ~/.zsh/bashagent

## Modules
autoload -U compinit
compinit

autoload -U promptinit
promptinit

## Use VI mode
bindkey -v

## Use VI cmd mode
# bindkey -a

## Configure history
>>>>>>> ba96a47 (Add tmux and vim conf, update zshrc)
export HISTSIZE=2000
export SAVEHIST=$HISTSIZE
export HISTFILE="$HOME/.config/zsh/.history"

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY


###################
# Where am I?
###################
# Location specific setup
if [[ -d '/google/' ]]; then
  # Running in Google's CloudShell
  RUNNING_ON='cloudshell'
  HOST='cloudshell'
elif [[ $(whoami) = 'codespace' ]]; then
  # Running in a GitHub CodeSpace
  HOST='codespace'
  RUNNING_ON='codespace'
elif [[ -d "/.dockerenv" ]]; then
  # Running in some other Docker env
  HOST='docker'
  RUNNING_ON='docker'
elif [[ `uname` = 'Darwin' ]]; then
  # Running on a Mac
  HOST="`hostname`"
  RUNNING_ON='mac'
else
  # Most likely running locally on linux
  RUNNING_ON='other'
  HOST="`hostname`"
fi;


###################
# Variables
###################
## Configure gopath
GOPATH="$HOME/Documents/code/go"
GOBIN="$GOPATH/bin"

TZ="America/Los_Angeles"
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/bin:$HOME/bin/google-cloud-sdk/bin:/usr/X11/bin:$GOBIN:$PATH"
PAGER='less'
EDITOR='nvim'
SVN_EDITOR='nvim'
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C
CC='gcc'
CFLAGS='-g -O3 -funroll-loops'



###################
# Antigen
###################
source $HOME/.config/zsh/antigen.zsh
 
# Load the oh-my-zsh's library
antigen use oh-my-zsh

<<<<<<< HEAD
# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
=======
## Export all variables
setopt   ALL_EXPORT

## Variables
TZ="America/Los_Angeles"
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:~/bin/:/usr/X11/bin:$PATH"
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
SVN_EDITOR='vim'
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C


## Key Bindings
bindkey "^r" history-incremental-search-backward
>>>>>>> ba96a47 (Add tmux and vim conf, update zshrc)

# VI mode
antigen bundle vi-mode

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# tmux
antigen bundle tmux

# Load the theme


#antigen theme robbyrussell
antigen theme joelpm/myzsh themes/joel

# Tell antigen that you're done
antigen apply


########################
# Cloud SDK 
########################

if [[ -d "$HOME/google-cloud-sdk" ]]; then
  # Local
  source $HOME/google-cloud-sdk/path.zsh.inc
  source $HOME/google-cloud-sdk/completion.zsh.inc
elif [[ -d "/google/" ]]; then
  # Cloudshell
  if [[ -e "/google/google-cloud-sdk/completion.zsh.inc" ]]; then
    source "/google/google-cloud-sdk/completion.zsh.inc"
  fi

  onexit () {
    for FILE in /google/devshell/bash_exit.google.d/*; do
      if [ -x "$FILE" ]; then
        "$FILE"
      fi
    done
  }
  trap onexit EXIT
fi
<<<<<<< HEAD
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
=======
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
  (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

PS1="[$PR_BLUE%n$PR_WHITE@$PR_GREEN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR]%(!.#.$) "
RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H:%M})$PR_NO_COLOR"


case $TERM in
  *xterm*|ansi)
        function settitle { print -Pn "\e]2;%n@%m: %~\a" }
        function chpwd { settitle }
        settitle
  ;;
esac



zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command' 

#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show
>>>>>>> ba96a47 (Add tmux and vim conf, update zshrc)
