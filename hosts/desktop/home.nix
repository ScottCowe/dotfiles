{ config, pkgs, ... }:

{
	home.username = "cowe";
	home.homeDirectory = "/home/cowe";

	home.stateVersion = "23.11"; 

	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
		discord
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

	imports = [
		../../modules/firefox.nix
		../../modules/git.nix
		../../modules/vim.nix
	];

	home.sessionVariables = {
		EDITOR = "vim";
	};

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
	#services.gvfs.enable = true;

	programs.home-manager.enable = true;
}
