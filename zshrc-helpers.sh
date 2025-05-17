
# ToDo: Move this oh-my-zsh to Home-Manager when setup
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
	if command -v curl &> /dev/null; then
		if [[ ! -f "$HOME/.zshrc" && -f "$HOME/.mynixos/.zshrc" ]]; then
			cp "$HOME/.mynixos/.zshrc"
		fi
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if [[ ! -d "$ZSH_CUSTOM/plugins/autoupdate" ]]; then
	git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate
fi


alias nixos-rebuild-test='nixos-rebuild test --use-remote-sudo'
alias nixos-rebuild-switch='nixos-rebuild switch --use-remote-sudo'