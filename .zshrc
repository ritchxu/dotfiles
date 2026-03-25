export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
# Hide hostname in agnoster prompt
prompt_context() {
  prompt_segment black default '%(!.%{%F{yellow}%}.)$USER'
}
