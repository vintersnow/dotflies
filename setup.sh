#!/bin/zsh -u
DOTFILES="${HOME}/.dotfiles"
if [ -d $DOTFILES -a -r $DOTFILES -a -x $DOTFILES ]; then
  for i in .?*; do
    if [ -r $i ]; then
      case $i in
        ..)
          continue;;
        .git)
          continue;;
        *)
          ln -fs "$DOTFILES/$i" "$HOME/$i";;
      esac
    fi
  done
fi
