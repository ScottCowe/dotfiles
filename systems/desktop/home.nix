{ ... }:

{
  imports = [
    ../../modules
    ../../home
  ];

  config = {
    git.enable = true; 
    ssh.enable = true;
    easyeffects.enable = true;
    neovim.enable = true;

    modules = {
      colors.enable = true;
      zsh.enable = true;
      # vim.enable = false;
      rofi.enable = true;
      gimp.enable = true;
      fonts.enable = true;
      thunar.enable = true;
      # neovim.enable = true;
      firefox.enable = true;
      wezterm.enable = true;
      discord.enable = true;
      packages.enable = true;
      hyprland.enable = true;
      alacritty.enable = true;
      prismlauncher.enable = true;
      macchina.enable = true;
      mako.enable = true;
      wlogout.enable = true;
      lf.enable = true;
      lutris.enable = true;
      waybar.enable = true;
      kitty.enable = true;
    };
  };
}
