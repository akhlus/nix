{
  description = "";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs @ {self, ...}: {
    templates = let
      mkTemplate = name: description: {
        inherit description;
        path = ./templates/${name};
      };
    in {
      go = mkTemplate "go" "Dev tools for golang";
      latex = mkTemplate "latex" "Flake to write LaTeX doc locally";
      minimal = mkTemplate "minimal" "Minimal flake";
      python = mkTemplate "python" "Dev tools for python";
    };
  };
}
