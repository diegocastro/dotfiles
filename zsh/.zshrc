# shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/dotfiles

# your project folder that we can 'c [tab]' to
export PROJECTS=~/Projetos

# load the paths file
source $ZSH/zsh/.zsh/paths.zsh

# load aliases file
source $ZSH/zsh/.zsh/aliases.zsh

# load config file
source $ZSH/zsh/.zsh/config.zsh

# load prompt file
source $ZSH/zsh/.zsh/prompt.zsh

# load window file
source $ZSH/zsh/.zsh/window.zsh

# load env file
source $ZSH/zsh/.zsh/env.zsh

# load theme
source $ZSH/zsh/.zsh/theme/theme.zsh

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load completion file
source $ZSH/zsh/.zsh/completion.zsh

unset config_files
