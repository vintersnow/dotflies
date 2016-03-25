# エイリアス

# alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

#locateコマンドのアップデート用
alias updatedb='sudo /usr/libexec/locate.updatedb'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias so='source '
alias sz='source ~/.zshrc'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias du='du -sh'

# git


#OS別alias
case ${OSTYPE} in
  darwin*)
  #Mac用の設定

  alias o='open .'

  alias uc='ulimit -c '
  alias ucu='ulimit -c unlimited'

  alias ls='gls -Fh  --color=auto'
  alias la='gls -A --color=auto'
  alias ll='gls -slhF --color=auto'
  alias lly='gls -slhF --color=auto --time-style=long-iso'

  alias rm='gmv -f --backup=numbered --target-directory ~/.Trash'

  #emacs deamon
  alias E='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
  alias emacs="TERM=xterm-256color /Applications/Emacs.app/Contents/MacOS/bin/emacsclient -nw"
  alias ekill="emacsclient -e '(kill-emacs)'"

  #purge
  alias purge='sudo purge'

  #other
  alias fa='find . -name 'alias fa='find . -name '
  alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'

  # script
  alias imgCrawler='~/Projects/script/imgCrawler/imgCrawler.sh '
  alias aoencoder='~/Projects/script/aozoraEncoder.sh'
  alias gitAC='~/Projects/script/gitAddCommit.sh'
  alias f='~/Projects/script/f.sh'
  alias bk='~/Projects/script/backup.sh'
  alias xrand='~/Projects/script/xorshift'
  alias stthesis="~/.dotfiles/shellscripts/setup_thesis.sh"

  #wine
  alias wine='~/Applications/wine/bin/nihonshu '

  #brew
  # alias brew='env PATH=${PATH/\/user\/local\/var\/\.pyenv\/shims:/} brew'

  #alias gdb='/usr/local/Cellar/gdb/7.9/bin/gdb'

  # Go
  alias gob='go build'
  alias gobd='go build -gcflags "-N -l"'

  #ag
  alias ag='ag -S'
  alias agl='ag -S --pager="less -R"'

  #pandoc
  alias panmp='pandoc -V documentclass=ltjarticle --latex-engine=lualatex'

  # quick look
  alias ql='qlmanage -p "$@" >& /dev/null'

  #git_make
  alias gi='/Users/izuku/Projects/UTLecture/2015practice/big_software/git_make/bin/git'

  alias cvlc='/Applications/VLC.app/Contents/MacOS/VLC --intf=rc'

  alias ipn='ipython notebook'

  #autojump
  alias j="autojump"
  if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
  fi
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

  ;;
  linux*)
  #Linux用の設定
  alias ls='ls -Fh  --color=auto'
  alias la='ls -A --color=auto'
  alias ll='ls -slhF --color=auto'
  alias lly='ls -slhF --color=auto --time-style=long-iso'
  ;;
esac

# global alias
alias -g L='| less -R'
alias -g G='| grep'
alias -g A='| ag'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g Te='| tee'

#suffix alias
alias -s hs=runhaskell
alias -s py=python
alias -s rb=ruby

function runc () {clang $1 && shift && ./a.out $@}
function runcpp () { clang++ $1 && shift && ./a.out $@ }
alias -s c=runc
alias -s cpp=runcpp

#git
alias gref='git reflog'
alias glog='git log --oneline --decorate --color --graph'


# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
  # Mac
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
  # Cygwin
  alias -g C='| putclip'
fi


function except_rm() {
  if [[ $# -eq 0 ]]; then
    return
  fi
  files=`\ls`
  for file in $*; do
    files=`echo $files | grep -v -E $file`
  done
  echo $files | xargs rm
}
alias erm='except_rm'
