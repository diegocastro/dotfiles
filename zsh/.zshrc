# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/dotfiles

# your project folder that we can 'c [tab]' to
export PROJECTS=~/Projetos

# load the paths file
for file in $(find "$ZSH" -iname 'path.zsh')
do
    source $file
done

# load everything but the path and completion files
for file in $(find "$ZSH" -type f  -iname '*.zsh' ! -iname 'path.zsh' ! -iname 'completion.zsh')
do
    source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in $(find "$ZSH" -type f -iname 'completion.zsh')
do
    source $file
done
