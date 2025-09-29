{...}: {
  imports = [
    ./cosmetic
    ./home.nix
    ./packages
  ];
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  xdg.terminal-exec = {
    enable = true;
    settings.default = ["ghostty.desktop"];
  };
}
