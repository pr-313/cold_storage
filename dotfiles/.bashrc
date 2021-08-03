# Source Micron standard .bashrc file
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
source /cde/prod/SM/setup/.bashrc.cde 
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# For help, go to webpage below:
#  http://rndweb.micron.com/tools/enviro/designEnv/
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

brb(){
buildreport -rnfl $1 | grep -v " / "
}

path(){
readlink -f $1
}

set_p4client(){
    cmd_str=$(cat .p4config)
    export $cmd_str
}

find_my_usage(){
find $1 -maxdepth $2 -user $USER -type d ! -path $1 -exec du -csh {} + | sort -hr
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


alias ag='/runs/simrun_tav/libs/bin/ag --hidden'
alias br="buildreport -rnl"
alias cmdline_long="export PS1='\[\033[0;35m\][\!:\h \[\033[0;33m\]\w]\[\033[00m\]: '"
alias cmdline_short="export PS1='\[\033[0;35m\][\!:\h \[\033[0;33m\]\W]\[\033[00m\]: '"
alias ctags="/runs/simrun_tav/libs/bin/ctags"
alias dgs='vim -c :Matrix'
alias fugitive="vim -c :Git"
alias glog="git log --graph --decorate --oneline --simplify-by-decoration"
alias glog_full="git log --graph --decorate --oneline"
alias lsof=/usr/sbin/lsof
alias nvim="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/runs/simrun_tav/libs/lib/ /runs/simrun_tav/libs/bin/nvim"
alias run_djinji="/runs/simrun_tav/tav_dev/jira_djinji/djinji/run_djinji.sh"
alias tmux="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/runs/simrun_tav/libs/lib/ /runs/simrun_tav/libs/bin/tmux"
alias vim="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/runs/simrun_tav/libs/lib/ /runs/simrun_tav/libs/bin/vim"
export EDITOR="$VISUAL"
export LD_LIBRARY_PATH="/eda/xcelium/19.09.006/tools/lib:/eda/vmanager/VMANAGER2009/tools/lib/"
export P4EDITOR=vim
export PATH=/runs/simrun_tav/libs/bin/:$PATH:$HOME/.local/bin/:$HOME/dev/bin/
export TERM=xterm-256color
export VISUAL=vim













# ag_exists=0
# bin_exists=0

# command -v "ag" > /dev/null && ag_exists=1
# command -v "rerun" > /dev/null && bin_exists=1

# if [ $bin_exists -eq 1 ] 
# then
    # echo "~/dev/bin paths set" > /dev/null
# else 
    # export PATH=$PATH:~/dev/bin/
# fi
# if [ $ag_exists -eq 1 ] 
# then
    # alias ag='/runs/simrun_tav/libs/bin/ag --hidden'
    # alias vim="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/runs/simrun_tav/libs/lib/ /runs/simrun_tav/libs/bin/vim"
    # export PATH=/runs/simrun_tav/libs/bin/:$PATH:~/.local/bin/
# else
    # if [[ $(uname -r) == *"3.10.0"* ]];
    # then
        # export PATH=/runs/simrun_tav/libs/bin/:$PATH:~/.local/bin/
        # alias ag='/runs/simrun_tav/libs/bin/ag --hidden'
        # alias vim="LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/runs/simrun_tav/libs/lib/ /runs/simrun_tav/libs/bin/vim"
    # else
        # export PATH=$PATH:~/the_silver_searcher_etx11/
# fi
# fi
# export FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/dev/resources/.ignore --nocolor -g ""'