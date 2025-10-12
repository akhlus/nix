{
  description = "Flake that holds all my nix stuff";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  outputs = inputs @ {self, ...}: let
    modules = import ./modules {inherit inputs self;};
    templates = import ./templates;
    systems = import ./systems {inherit inputs self;};
  in {
    inherit (modules) darwinModules homeModules nixosModules;
    inherit (templates) templates;
    inherit (systems) darwinConfigurations homeConfigurations nixosConfigurations;
  };
}
