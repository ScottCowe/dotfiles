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

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        size = "standard";
        tweaks = [];
        variant = "mocha";
      };
    };
  };

  services.ssh-agent.enable = true;
}
