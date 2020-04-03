# Forcing colored shell
force_color_prompt=yes

# Setting shell colors
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

# Optimization stuff from default bashrc file from Debian Buster
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash-completion ]; then
    . /usr/share/bash-completion/bash-completion
  elif [ -f /etc/bash-completion ]; then
    . /etc/bash_completion
  fi
fi
