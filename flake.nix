{
  description = "Flake that holds all my nix stuff";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs @ {self, ...}: let
    mkTemplate = name: description: {
      inherit description;
      path = ./templates/${name};
    };
  in {
    templates = {
      go = mkTemplate "go" "Dev tools for golang";
      go-package = mkTemplate "go-package" "Flake to build golang package with necessary dev tools";
      latex = mkTemplate "latex" "Flake to write LaTeX doc locally";
      minimal = mkTemplate "minimal" "Minimal flake";
      python = mkTemplate "python" "Dev tools for python";
      shell = mkTemplate "shell" "Empty devShell flake";
    };
  };
}
