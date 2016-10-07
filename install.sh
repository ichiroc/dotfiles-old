#!/bin/bash

# Make symlink
for arg in .tmux.conf .screenrc .rubocop.yml .ctags .xvimrc .spacemacs.d
do
    ln -sf ~/dotfiles/${arg} ~/${arg}
done

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.oh-my-zsh/custom ~/.oh-my-zsh/custom
