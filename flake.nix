{
  description = "Flake that holds all my nix stuff";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };
  outputs = inputs @ {self, ...}: {
    darwinModules = rec {
      darwin.imports = [
        inputs.nix-homebrew.darwinModules.default
        ./modules/darwin
      ];
      home.imports = [
        inputs.home-manager.darwinModules.home-manager
        ./modules/darwin/home.nix
      ];
      default.imports = darwin.imports ++ home.imports;
    };

    homeModules.default.imports = [./modules/home];

    nixosModules = rec {
      nixos.imports = [
        ./modules/nixos
      ];
      home.imports = [
        inputs.home-manager.nixosModules.home-manager
        ./modules/nixos/home.nix
      ];
      default.imports = nixos.imports ++ home.imports;
    };

    templates = let
      mkTemplate = name: description: {
        inherit description;
        path = ./templates/${name};
      };
    in {
      darwin = mkTemplate "darwin" "Darwin system flake";
      go = mkTemplate "go" "Dev tools for golang";
      go-package = mkTemplate "go-package" "Flake to build golang package with necessary dev tools";
      home = mkTemplate "home" "Home-manager config flake";
      jovian = mkTemplate "jovian" "Nixos system with jovian setup";
      latex = mkTemplate "latex" "Flake to write LaTeX doc locally";
      nixos = mkTemplate "nixos" "Simple nixos config flake";
      minimal = mkTemplate "minimal" "Minimal flake";
      mobile = mkTemplate "mobile" "Mobile nixos config";
      python = mkTemplate "python" "Dev tools for python";
      shell = mkTemplate "shell" "Empty devShell flake";
    };
  };
}
