{ config, pkgs, ... }:

{

  # ToDo: Doesn't seem to work, just move it to Home-Manager
  # users.users.berto = {
  #   openssh.authorizedKeys.keys = [
  #       # dev-linux-manjaro
  #       "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBR2kcSywuot2jL86VXqDkhcNAarEGHDx/hCHoxo3xgf berto@dev-linux-manjaro"
  #   ];
  # };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # ToDo: Get rid of this when sublime4 fixes this
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    ack
    screen
    rclone
    p7zip
    libxml2
    neofetch

    python3
    python313Full
    pipx
    
    zsh
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting
    zsh-powerlevel10k
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

}
