# nixos

## Setup

### Clone repo
```bash
nix-shell -p git
git clone https://github.com/c0d3m0nky/nixos.git "$HOME/.mynixos"
cp $HOME/.mynixos/zshrc-base.sh .zshrc
```

### Edit config
```bash
sudoedit /etc/nixos/configuration.nix
```
```Nix
{ config, pkgs, ... }:

let
  mynixos = "/home/[username]/.mynixos";
in
{
  imports =
    [
      ...
      "${mynixos}/configs/base.nix"
      "${mynixos}/configs/kde.nix"
      "${mynixos}/configs/dev.nix"
      "${mynixos}/configs/vm.nix"
      ...
    ];
    ...
    networking.hostname = "[CHANGEME]"
}
```

### Apply (NIXPKGS_ALLOW_INSECURE needed for sublime4)
```bash
export NIXPKGS_ALLOW_INSECURE=1
nixos-rebuild switch --use-remote-sudo
```
- Change Konsole default to zsh

### Change "permissions" on repo
```zsh
ssh-keygen -t ed25519
cat "$HOME/.ssh/id_ed25519.pub"
```
- Change KDE Connect name
- Pass key over KDE Connect and add to github
```zsh
cd "$HOME/.mynixos"
git config --global --add safe.directory "$HOME/.mynixos"
git remote set-url "origin" git@github.com:c0d3m0nky/nixos.git
git pull
```

## ToDo

- Home-Manager
	- Figure out how to change default font in Warp
	- Move oh-my-zsh setup out of zshrc-helpers.sh
	- Move zsh-toolkit setup out of zshrc-helpers.sh
	- openssh.authorizedKeys.keys
- Get rid of permittedInsecurePackages when sublime4 fixes it's dependencies