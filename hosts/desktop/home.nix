{ config, pkgs, ... }:

{
	home.username = "cowe";
	home.homeDirectory = "/home/cowe";

	home.stateVersion = "23.11"; 

	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
		discord
		vlc
		alacritty
		vim 
		rofi
		mako
	];

	imports = [
		../../modules/home-manager/firefox.nix
		../../modules/home-manager/git.nix
	];

	home.sessionVariables = {
		EDITOR = "vim";
	};

	services.ssh-agent.enable = true;

	programs.home-manager.enable = true;
}
