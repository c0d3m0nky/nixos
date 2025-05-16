{ config, pkgs, ... }:

{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.berto = {
    isNormalUser = true;
    description = "berto";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [
        # dev-linux-manjaro
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBR2kcSywuot2jL86VXqDkhcNAarEGHDx/hCHoxo3xgf berto@dev-linux-manjaro"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    ack
    python3
    python313Full
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
