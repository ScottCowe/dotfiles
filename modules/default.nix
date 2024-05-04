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
    ./gimp
    ./fonts
    ./thunar
    ./neovim
    ./nixvim
    ./firefox
    ./discord
    ./wezterm
    ./packages
    ./hyprland
    ./alacritty
    ./prismlauncher
  ];
}
