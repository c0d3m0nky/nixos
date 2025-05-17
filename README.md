# nixos

## Setup

```bash
nix-shell -p git
sudo git clone https://github.com/c0d3m0nky/nixos.git "$HOME/.mynixos"
cp $HOME/.mynixos/zshrc-base.sh .zshrc
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

```bash
export NIXPKGS_ALLOW_INSECURE=1
# 🠝 Needed for sublime4
nixos-rebuild switch --use-remote-sudo
```

- Change Konsole default to zsh

```bash
ssh-keygen -t ed25519
cat "$HOME/.ssh/id_ed25519.pub"
```

- Pass key over KDE Connect and add to github

```bash
cd "$HOME/.mynixos"
git remote set-url "origin" git@github.com:c0d3m0nky/nixos.git
git pull
```
