set -o vi

for f in ~/.bash-my-aws/lib/*-functions; do source $f; done

source ~/.bash-my-aws/bash_completion.sh

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
RUBIES=(~/.rubies)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
