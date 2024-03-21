{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ../../modules/default.nix
  ];

  config.modules = {
    git.enable = true;
    zsh.enable = true;
    vim.enable = true;
    ssh.enable = true;
    gtk.enable = true;
    rofi.enable = true;
    fonts.enable = true;
    thunar.enable = true;
    neovim.enable = true;
    firefox.enable = true;
    discord.enable = true;
    packages.enable = true;
    hyprland.enable = true;
    alacritty.enable = true;
    prismlauncher.enable = true;
  };
}
