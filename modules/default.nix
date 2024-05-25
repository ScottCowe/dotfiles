{ inputs, pkgs, config, ... }:

{
  home.stateVersion = "23.11";

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./colors
    ./zsh
    ./vim
    ./ssh
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
    ./lf
    ./lutris
    ./waybar
    ./kitty
  ];
}
