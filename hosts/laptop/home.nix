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
    gimp.enable = false;
    idea.enable = false;
    fonts.enable = true;
    thunar.enable = true;
    neovim.enable = true;
    firefox.enable = true;
    wezterm.enable = true;
    discord.enable = true;
    packages.enable = true;
    hyprland.enable = true;
    alacritty.enable = true;
    prismlauncher.enable = false;
  };
}
