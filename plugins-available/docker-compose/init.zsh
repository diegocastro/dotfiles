PLUGINDIR=${0:h}

xsource "$PLUGINDIR/alias.zsh"
xsource "$PLUGINDIR/env.zsh"
xsource "$PLUGINDIR/function.zsh"

# load completion dir
fpath=($PLUGINDIR/completion $fpath)
