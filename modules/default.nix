{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    ./git
    ./zsh
    ./vim
    ./ssh
    ./gtk
    ./rofi
    ./thunar
    ./firefox
    ./discord
    ./packages
    ./hyprland
    ./alacritty
  ];
}
