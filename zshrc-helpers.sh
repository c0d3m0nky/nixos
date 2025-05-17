
# ToDo: Move this oh-my-zsh setup to Home-Manager when setup
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	if command -v curl &> /dev/null; then
		if [[ ! -f "$HOME/.zshrc" && -f "$HOME/.mynixos/.zshrc" ]]; then
			cp "$HOME/.mynixos/.zshrc"
		fi
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
fi

isGood=0

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
	isGood=$?
fi

if $isGood; then
	plugins+=('zsh-autosuggestions');
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	isGood=$?
fi

if $isGood; then
	plugins+=('zsh-syntax-highlighting');
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/autoupdate" ]]; then
	git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
	isGood=$?
fi

if $isGood; then
	plugins+=('autoupdate');
fi

if $NIX_DEV; then
	ZSHCOM="$HOME/dev/github/zsh-toolkit"
	if [[ ! -d "$ZSHCOM" ]]; then
		mkdir -p "$ZSHCOM";
		git clone git@github.com:c0d3m0nky/zsh-toolkit.git "$ZSHCOM";
	fi
else
	ZSHCOM="$HOME/.zsh-toolkit"
	if [[ ! -d "$ZSHCOM" ]]; then
		git clone https://github.com/c0d3m0nky/zsh-toolkit.git "$ZSHCOM";
	fi
fi

# ToDo: Move this zsh-toolkit setup to Home-Manager when setup
if [[ -f "$ZSHCOM/init.sh" ]]; then
	if [[ ! "$PATH" =~ "$HOME/.local/bin" ]]; then 
		export PATH="$PATH:$HOME/.local/bin";
	fi	
	source "$ZSHCOM/init.sh"
fi

alias nixos-rebuild-test='nixos-rebuild test --use-remote-sudo'
alias nixos-rebuild-switch='nixos-rebuild switch --use-remote-sudo'