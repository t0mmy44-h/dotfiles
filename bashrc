alias docker_clean_dangling='docker rmi $(docker images -qa --filter="dangling=true")'
alias kill_containers='docker ps -q | xargs docker kill'
alias remove_containers='docker ps -qa | xargs docker rm'
alias remove_images='docker images -qa | xargs docker rmi'
alias remove_volumes='docker volume ls -q | xargs docker volume rm'
alias prune_volumes='docker volume prune'
alias docker_dfe='kill_containers && remove_containers && remove_images && remove_volumes'
alias ddfe='docker_dfe'
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias be='bundle exec'
alias vi='nvim'
alias vim='nvim'
alias slip='rea-slip-docker-login'
alias tls='tmux list-sessions'
alias tks='tmux kill-session -t'
alias tat='tmux attach -t'

function __tns() { tmux new-session -s ${@-${PWD##*/}}; };
alias tns='__tns'
set -o vi

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
RUBIES=(~/.rubies)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
