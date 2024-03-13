{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = { 
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons"; 
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
	  nixosConfigurations = {
	  	desktop = nixpkgs.lib.nixosSystem {
		  specialArgs = { inherit inputs; };
          modules = [ 
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.default
          ];
		};

		laptop = nixpkgs.lib.nixosSystem {
		  specialArgs = {inherit inputs;};
		  modules = [ 
            ./hosts/laptop/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
		};
	  };
    };
}
