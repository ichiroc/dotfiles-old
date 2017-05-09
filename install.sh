#!/bin/bash

# Make symlink
for arg in .tmux.conf .screenrc .rubocop.yml .ctags .xvimrc .spacemacs.d
do
    ln -sf ~/dev/dotfiles/${arg} ~/${arg}
done

ln -sf ~/dev/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dev/dotfiles/zsh/.oh-my-zsh/custom/theme ~/.oh-my-zsh/custom/theme
