# zsh
alias reload!='. ~/.zshrc'

# git
alias gst='git status'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gp='git push origin HEAD'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# php
## symfony 2 commands completion
alias sf='php app/console'
alias sfdmd='sf doctrine:migrations:diff'
alias sfdmm='sf doctrine:migrations:migrate'
alias sfdgf='sf doctrine:generate:form'
alias sfdge='sf doctrine:generate:entity'
alias sfdges='sf doctrine:generate:entities'

# python
## django
alias pm='python manage.py'
alias pmr='python manage.py runserver'
alias djs='source venv/bin/activate'

# system
alias ls="ls -F --color"
alias lsa="ls -lAh --color"

## debian/ubuntu specific
alias ad='sudo apt update'
alias ag='sudo apt upgrade'
alias ai='sudo apt install'
alias ac='sudo apt-get clean'