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
    xfce.thunar
    xfce.xfconf
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    gnome.gnome-themes-extra
  ];
}
