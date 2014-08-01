# Executes commands at login pre-zshrc.

# Browser
[[ "$OSTYPE" == darwin* ]] && export BROWSER='open'


# Editors
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export RUBYOPT=rubygems


# Language

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi


# Paths

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
cdpath=(
    $cdpath
    $HOME/Dropbox/projects
)

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/.dotfiles/bin
  $HOME/.dotfiles/bin/`hostname`
  /usr/local/{bin,sbin}
  /usr/local/opt/{rb,py}env
  $path
)

fpath=(
  $HOME/.zsh/themes
  $fpath
)


# Less

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi


# Temporary Files

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi