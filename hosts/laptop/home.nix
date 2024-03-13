{ config, pkgs, ... }:

{
	home.username = "cowe";
	home.homeDirectory = "/home/cowe";

	home.stateVersion = "23.11"; 

	nixpkgs.config.allowUnfree = true;

	home.packages = with pkgs; [
		discord
		vlc
	];

	imports = [
		../../modules/firefox.nix
        ../../modules/git.nix
        ../../modules/vim.nix
	];

	home.sessionVariables = {
		EDITOR = "vim";
	};

	services.ssh-agent.enable = true;

	programs.home-manager.enable = true;
}
