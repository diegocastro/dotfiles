if [[ -f /usr/local/share/chruby/chruby.sh ]]; then
	source /usr/local/share/chruby/chruby.sh

	# default ruby
	chruby ruby-2.2.1
fi