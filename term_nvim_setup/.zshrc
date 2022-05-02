# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

source ~/.bashrc

if [ -n "`echo $ZSH_VERSION`" ]; then
    export ZSH="$HOME/.oh-my-zsh"
    source $ZSH/oh-my-zsh.sh
    DISABLE_AUTO_TITLE="true"
    # ENABLE_CORRECTION="true"
    ZSH_DISABLE_COMPFIX="true"
    MODE_INDICATOR="%F{yellow}+%f"
    VI_MODE_SET_CURSOR=true

    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    HISTFILE=~/.zsh_history
    HISTSIZE=10000
    SAVEHIST=10000
    setopt appendhistory
    bindkey  "^[[1~"   beginning-of-line
    bindkey  "^[[H"   beginning-of-line
    bindkey  "^[[4~"   end-of-line
    bindkey  "^[[F"   end-of-line
    bindkey  "^[[3~"  delete-char
    # source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /runs/simrun_tav/libs/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /runs/simrun_tav/libs/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    long='%(?.%F{green}√.%F{red}?%?)%f %B%m: %F{240}%~ %{$fg_bold[blue]%}$(git_current_branch) %f%b%# '
    short='%(?.%F{green}√.%F{red}?%?)%f %B%m: %F{240}%1~ %{$fg_bold[blue]%}$(git_current_branch) %f%b%# '
    alias cmdline_long='export PS1=$long'
    alias cmdline_short='export PS1=$short'
    export PS1=$long
fi

