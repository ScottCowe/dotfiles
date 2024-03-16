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
    ./fonts
    ./thunar
    ./firefox
    ./discord
    ./packages
    ./hyprland
    ./alacritty
  ];
}
