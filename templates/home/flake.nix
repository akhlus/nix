{
  description = "Home-manager flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-akhlus = {
      url = "github:akhlus/nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    #optional extras
    #nix-flatpak.url = "github:gmodena/nix-flatpak";
    #nixgl.url = "github:nix-community/nixGL";
  };
  outputs = inputs @ {...}: let
    system = "x86_64-linux";
    username = "sam";
  in {
    homeConfigurations.${username} = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      specialArgs = {
        inherit inputs username;
        flakePath = "/home/${username}/home";
      };
      modules = [
        #inputs.nix-flatpak.homeManagerModules.nix-flatpak
        inputs.nix-akhlus.homeModules.default
        ./home.nix
      ];
    };
  };
}
