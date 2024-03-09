{ config, pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true; 

    profiles.cowe = {
      search = {
        force = true;
	default = "DuckDuckGo";
	engines = {
	  "Nix Packages" = {
	    urls = [{
		template = "https://search.nixos.org/packages";
		params = [
		  { name = "type"; value = "packages"; }
		  { name = "query"; value = "{searchTerms}"; }
		];
	    }];
	    icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
	    definedAliases = [ "@np" ];
	  };
	  "NixOS Wiki" = {
	    urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
	    iconUpdateURL = "https://nixos.wiki/favicon.png";
	    updateInterval = 24 * 60 * 60 * 1000;
	    definedAliases = [ "@nw" ];
	  };
	  "Wikipedia (en)".metaData.alias = "@wiki";
	  "Google".metaData.hidden = true;
	  "Amazon.com".metaData.hidden = true;
	  "Bing".metaData.hidden = true;
	  "eBay".metaData.hidden = true;
	};
      };

      #extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      #	bitwarden
      #	ublock-origin
      #	firefox-color
      #	stylus
      #];
    };
  };
}
