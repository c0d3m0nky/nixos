{ config, pkgs, ... }:

{ imports = [ ./desktop.nix ];

  environment.systemPackages = with pkgs; [
    jetbrains-toolbox
    vscode
  ];

}
