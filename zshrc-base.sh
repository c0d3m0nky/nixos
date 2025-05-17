export ZSH="$HOME/.oh-my-zsh"

# ToDo: Figure out how to change default font in Warp
if [[ "$TERM" == 'xterm-kitty' || "$TERM_PROGRAM" == "WarpTerminal" ]]
then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME="wedisagree"
fi

plugins=(
	git
)
	

source $ZSH/oh-my-zsh.sh
source $HOME/.mynixos/zshrc-helpers.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

screensOpen=$(screen -ls | ack -i '^(\d+) sockets? in' --output '$1')

if (( screensOpen > 0 ));
then
  screen -ls
fi