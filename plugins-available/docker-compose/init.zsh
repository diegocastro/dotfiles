PLUGINDIR=${0:h}

xsource "$PLUGINDIR/alias.zsh"

# load our function and completion directories
fpath=($PLUGINDIR/completion $fpath)
