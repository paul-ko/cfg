# Make git bash's shell behave more like Debian/Ubuntu does out of the box, along with
# a few other tweaks.
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
