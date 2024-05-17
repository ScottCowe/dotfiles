{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ../../modules/default.nix
  ];

  config.modules = {
    colors.enable = true;
    git.enable = true;
    zsh.enable = true;
    vim.enable = true;
    ssh.enable = true;
    rofi.enable = true;
    gimp.enable = false;
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
    mako.enable = true;
    wlogout.enable = true;
    lf.enable = true;
  };
}
