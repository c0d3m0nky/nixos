{ config, pkgs, ... }:

{ imports = [ ./desktop.nix ];

  environment.variables = {
    NIX_DEV = 0;
  };

  environment.systemPackages = with pkgs; [
    jetbrains-toolbox
    vscode
    bruno
  ];

}
