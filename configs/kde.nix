{ config, pkgs, ... }:

{ imports = [ ./desktop.nix ];

  programs.kdeconnect.enable = true;

}
