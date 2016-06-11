source ~/.bashrc

# Path to the bash it configuration
export BASH_IT="/home/tommy/.bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
# export BASH_IT_THEME='bakke'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

export AWS_CLI=/usr/local/bin/aws
export IDP_USER=thomas.hammond

source ~/saml-aws-functions/bash-functions
for f in ~/.bash-my-aws/lib/*-functions; do source $f; done
source ~/.bash-my-aws/bash_completion.sh
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

SCM_THEME_PROMPT_DIRTY_SYMBOL=""
SCM_THEME_PROMPT_CLEAN_SYMBOL=""

SCM_THEME_PROMPT_PREFIX="${cyan}(${blue}"
SCM_THEME_PROMPT_SUFFIX="${cyan})"
SCM_THEME_PROMPT_DIRTY=" ${red}${SCM_THEME_PROMPT_DIRTY_SYMBOL} "
SCM_THEME_PROMPT_CLEAN=" ${green}${SCM_THEME_PROMPT_CLEAN_SYMBOL} "
LOGO=""
LOGO_PREFIX="${orange}${LOGO}${reset_color} "
LAST_ARROW="→"

exit_status() {
  local EXIT="$?"
  if [ $EXIT != 0 ]; then
    LAST_ARROW="${red}→${reset_color}"
  else
    LAST_ARROW="${green}→${reset_color}"
  fi
}

prompt() {
  exit_status

  if ! { [ -n "$TMUX" ]; } then
    PS1="${LOGO_PREFIX}$(scm_prompt_info)${reset_color} ${cyan}\W${reset_color} ${LAST_ARROW} "
  else
    (update_tmux &) &> /dev/null
    PS1="${LOGO_PREFIX}${reset_color} ${cyan}\W${reset_color} ${LAST_ARROW} "
  fi
}

update_tmux(){
  # TMUX has a special prompt
  SCM_THEME_PROMPT_PREFIX=""
  SCM_THEME_PROMPT_SUFFIX=""
  SCM_THEME_PROMPT_DIRTY=" ${SCM_THEME_PROMPT_DIRTY_SYMBOL} "
  SCM_THEME_PROMPT_CLEAN=" ${SCM_THEME_PROMPT_CLEAN_SYMBOL} "
  tmux set-option -gq "@scm_info" "$(scm_prompt_info)"
  tmux refresh-client -S
}

PROMPT_COMMAND=prompt

eval $(docker-machine env default)
