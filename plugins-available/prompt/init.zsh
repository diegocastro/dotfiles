## prompt theme
BASE16_SHELL=${0:h}/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

zstyle ':prompt:grml:left:items:user' pre '%B%F{white}'
zstyle ':prompt:grml:left:items:host' pre '%B%F{white}'
zstyle ':prompt:grml:left:items:host' post '%f%b'
zstyle ':prompt:grml:left:items:host' token '%m %F{blue}::%f '
zstyle ':prompt:grml:left:items:path' pre '%F{green}'
zstyle ':prompt:grml:left:items:at' pre '%B%F{white}'
zstyle ':prompt:grml:left:items:at' post '%f%b'
zstyle ':prompt:grml:left:items:percent' pre '%F{blue}'
zstyle ':prompt:grml:left:items:percent' post '%f'
zstyle ':prompt:grml:left:items:percent' token '$ '
