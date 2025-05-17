# nixos

## Setup

```bash
sudo git clone git@github.com:c0d3m0nky/nixos.git "$HOME/.mynixos"
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
}
```

```bash
nixos-rebuild switch --use-remote-sudo
```
