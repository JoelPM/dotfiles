## If not running interactively, do nothing 
[ -z "$PS1" ] && return

###################
# History
###################
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

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git

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
# NVM
########################
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"


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
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joel.meyer/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/joel.meyer/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joel.meyer/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/joel.meyer/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
