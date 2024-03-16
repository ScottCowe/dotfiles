{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ../../modules/packages.nix
    ../../modules/default.nix
  ];

  config.modules = {
    git.enable = true;
    zsh.enable = true;
    vim.enable = true;
    ssh.enable = true;
    gtk.enable = true;
    thunar.enable = true;
    firefox.enable = true;
    discord.enable = true;
  };
}
