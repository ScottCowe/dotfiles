{ config, pkgs, inputs, ... }:

{
  home.username = "cowe";
  home.homeDirectory = "/home/cowe";

  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    discord
    pavucontrol
    zip
    unzip
    libreoffice-fresh
    thunderbird
    python3
    grim
    slurp
    wl-clipboard
    samba
    prismlauncher
    lutris
    filezilla
    obs-studio
    vlc
  ];

  home.file = {
  
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  imports = [
    ./apps/firefox.nix
  ];

  programs.home-manager.enable = true;
}
