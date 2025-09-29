{
  description = "A simple Python development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        pythonEnv = pkgs.python3.withPackages (p:
          with p; [
            #python packages go here
          ]);
      in {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            pythonEnv
          ];
          shellHook = ''
            export PATH=${pythonEnv}/bin:$PATH
            export PYTHONPATH=${pythonEnv}/${pkgs.python3.sitePackages}:$PYTHONPATH
          '';
        };
      }
    );
}
