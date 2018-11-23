alias fdisk='fdisk --color=always'
alias grep='grep --color=always'
alias ls='ls --color=always'
alias l='ls -la --color=always'
alias vi='nvim'
alias vim='nvim'
alias emc='emacsclient -c -a ""'
alias em='emacsclient -nw -a ""'
# alias lspasscp='lpass show -c --password $(lpass ls  | fzf | awk '{print $(NF)}' | sed 's/\\]//g')'

# fixing pdflatex
#alias pdflatex='/usr/bin/pdflatex'
#alias pdftex='/usr/bin/pdftex'

# fd - cd to selected directory
fdd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
