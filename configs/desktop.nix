{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    sublime4
    sublime-merge
    warp-terminal
  ];

}
