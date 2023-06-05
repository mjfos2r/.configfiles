#!/bin/bash

echo "cloning zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "Done!"

echo "cloning conda-zsh-completion"
git clone https://github.com/esc/conda-zsh-completion ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/conda-zsh-completion
echo "Done"
echo ""
echo "okay, now run source .zshrc to reset the shell!"
exit 0


