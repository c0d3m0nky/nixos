# nixos

## Setup

```bash
sudo git clone https://github.com/c0d3m0nky/nixos.git /etc/nixos/mynixos
```

```Nix
{ config, pkgs, ... }:

{
  imports =
    [
      ...
      ./mynixos/configs/base.nix
      ./mynixos/configs/kde.nix
      ./mynixos/configs/dev.nix
      ./mynixos/configs/vm.nix
      ...
    ];
    ...
}
```

```bash
nixos-rebuild switch --use-remote-sudo
```
