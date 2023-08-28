if status is-interactive
    # Commands to run in interactive sessions can go here
end

# lightning
set -x LIGHTNING_SQUAD_PROJECT_ID "22AF95B8-D4CE-487A-9147-9465FC80E379"
set -x NODE_OPTIONS "--openssl-legacy-provider"
set -x AWS_DEFAULT_PROFILE "byoc-sandbox"
set -x AWS_PROFILE "byoc-sandbox"

set -x GOPATH $HOME/go
set -x GOROOT /opt/homebrew/Cellar/go/1.20.2/libexec
set PATH /opt/homebrew/bin /opt/homebrew/opt/gnu-sed/libexec/gnubin $GOPATH/bin $GOROOT/bin $PATH
# Unfortunately nvim is not available on most systems, so use vim as fallvack
if type -q nvim;
  set -x EDITOR 'nvim';
else
  set -x EDITOR 'vim';
end

# load homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"


# conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Work Related -> lightning.ai
alias L="lightning"
alias LP="LIGHTNING_CLOUD_PROJECT_ID=$LIGHTNING_SQUAD_PROJECT_ID lightning"
alias make_develop="make develop && docker stop grid-backend-grid-controlplane-1"

# exa > ls
alias ls="exa --icons --group-directories-first"
alias ll="exa --icons --group-directories-first -l"

# more beautiful
alias grep='grep --color'
