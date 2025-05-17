# nixos

## Setup

```bash
nix-shell -p git
sudo git clone https://github.com/c0d3m0nky/nixos.git "$HOME/.mynixos"
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
nixos-rebuild switch --use-remote-sudo
```

Change Konsole default to zsh

```bash
ssh-keygen -t ed25519
cat "$HOME/.ssh/id_ed25519.pub"
```

Pass key over KDE Connect and add to github

```bash
ssh-keygen -t ed25519
cat "$HOME/.ssh/id_ed25519.pub"
```
