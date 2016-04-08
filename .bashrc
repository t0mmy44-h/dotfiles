alias docker_restart='docker-machine restart default'
alias docker_clean_dangling='docker rmi $(docker images -qa --filter="dangling=true")'
alias docker_clean_images='docker rmi -f  $(docker images -qa)'
alias docker_clean_containers='docker rm -f $(docker ps -qa)'
alias docker_clean_running='docker rm -f $(docker ps -qa)'
alias docker_fix_network='docker-machine ssh default "echo search win.int.realestate.com.au > /et    c/resolv.conf && echo nameserver 10.150.1.10 >>/etc/resolv.conf && echo nameserver 10.129.148.30     >> /etc/resolv.conf && sudo /etc/init.d/docker restart"'
set -o vi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
