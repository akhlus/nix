{inputs, ...}: {
  darwinModules = rec {
    darwin.imports = [
      inputs.nix-homebrew.darwinModules.default
      ./darwin
    ];
    home.imports = [
      inputs.home-manager.darwinModules.home-manager
      ./darwin/home.nix
    ];
    default.imports = darwin.imports ++ home.imports;
  };

  homeModules = rec {
    default.imports = [./home];
    de.imports = [
      inputs.plasma-manager.homeModules.plasma-manager
      ./home/de
    ];
    all.imports = default.imports ++ de.imports;
  };

  nixosModules = rec {
    nixos.imports = [./nixos];
    home.imports = [
      inputs.home-manager.nixosModules.home-manager
      ./nixos/home.nix
    ];
    default.imports = nixos.imports ++ home.imports;
  };
}
