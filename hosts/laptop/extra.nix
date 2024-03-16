{ config, lib, pkgs, inputs, ... }:

{
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    jetbrains-mono
  ];
}
