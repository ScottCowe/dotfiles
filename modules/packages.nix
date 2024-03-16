{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    rofi
    mako
    grim
    slurp
    wl-clipboard
    zip
    unzip
  ];
}
