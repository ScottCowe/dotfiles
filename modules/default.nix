{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./colors
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
    ./firefox
    ./discord
    ./wezterm
    ./packages
    ./hyprland
    ./alacritty
    ./prismlauncher
    ./macchina
    ./mako
    ./wlogout
  ];
}
