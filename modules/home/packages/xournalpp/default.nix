{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages;
in {
  options.hMods.packages.xournalpp = {
    enable = lib.mkEnableOption "Xournalpp" // {default = cfg.enableMinimal;};
    package = lib.mkPackageOption pkgs "xournalpp" {nullable = true;};
  };
  config = (lib.mkIf cfg.xournalpp.enable) {
    home.packages = [cfg.package];
    home.file = {
      ".config/xournalpp/palette.gpl".source = ./palette.gpl;
      ".config/xournalpp/toolbar.ini".source = ./toolbar.ini;
    };
  };
}
