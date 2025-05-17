
sourceOhMyZsh=1

# ToDo: Move this oh-my-zsh setup to Home-Manager when setup
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	if command -v curl &> /dev/null; then
		if [[ ! -f "$HOME/.zshrc" && -f "$HOME/.mynixos/.zshrc" ]]; then
			cp "$HOME/.mynixos/.zshrc"
		fi
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		sourceOhMyZsh=0
		if [[ -f "$HOME/.zshrc.pre-oh-my-zsh" ]]; then
			mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"
		fi
	fi
fi

isGood=0

if [[ ! -d "$ZSH_CUSTOM/plugins" ]]; then
	mkdir -p "$ZSH_CUSTOM/plugins";
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
	isGood=$?
	if [[ $isGood ]]; then
		sourceOhMyZsh=0
	fi
fi

if [[ $isGood ]]; then
	plugins+=('zsh-autosuggestions');
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	isGood=$?
	if [[ $isGood ]]; then
		sourceOhMyZsh=0
	fi
fi

if [[ $isGood ]]; then
	plugins+=('zsh-syntax-highlighting');
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/autoupdate" ]]; then
	git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
	isGood=$?
	if [[ $isGood ]]; then
		sourceOhMyZsh=0
	fi
fi

if [[ $isGood ]]; then
	plugins+=('autoupdate');
fi

if $NIX_DEV; then
	ZSHCOM="$HOME/dev/github/zsh-toolkit"
	if [[ ! -d "$ZSHCOM" ]]; then
		mkdir -p "$ZSHCOM";
		git clone git@github.com:c0d3m0nky/zsh-toolkit.git "$ZSHCOM";
		git checkout next
	fi
else
	ZSHCOM="$HOME/.zsh-toolkit"
	if [[ ! -d "$ZSHCOM" ]]; then
		git clone https://github.com/c0d3m0nky/zsh-toolkit.git "$ZSHCOM";
	fi
fi

if [[ $sourceOhMyZsh ]]; then
	_source "$ZSH/oh-my-zsh.sh"
fi

# ToDo: Move this zsh-toolkit setup to Home-Manager when setup
if [[ -f "$ZSHCOM/init.sh" ]]; then
	if [[ ! "$PATH" =~ "$HOME/.local/bin" ]]; then 
		export PATH="$PATH:$HOME/.local/bin";
	fi	
	source "$ZSHCOM/init.sh"
fi

function nixos-checkUpdates() {
	git -C "$HOME/.mynixos" pull;
	nix-channel --update;
	currDir=$(pwd);
	buildDir="$HOME/.cache/nixos-checkUpdates/build";

	if [[ -d "$buildDir" ]]; then
		rm -rf "$buildDir";
	fi

	mkdir -p "$buildDir";
	cd "$buildDir";
	nixos-rebuild build;
	nvd diff /run/current-system "$buildDir/result";
	cd "$currDir";
}

alias nixos-rebuild-test='nixos-rebuild test --use-remote-sudo'
alias nixos-rebuild-switch='nixos-rebuild switch --use-remote-sudo'
alias nixos-rebuild-upgrade-test='git -C "$HOME/.mynixos" pull && nixos-rebuild test --upgrade --use-remote-sudo'
alias nixos-rebuild-upgrade='git -C "$HOME/.mynixos" pull && nixos-rebuild switch --upgrade --use-remote-sudo'