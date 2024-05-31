{ ... }:

{
  imports = [
    ../../modules
    ../../home
  ];

  config = {
    neovim.enable = true;

    modules = {
      colors.enable = true;
      rofi.enable = true;
      gimp.enable = false;
      fonts.enable = true;
      thunar.enable = true;
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
      waybar.enable = true;
    };
  };
}
