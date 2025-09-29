{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages;
in {
  options.hMods.packages.xournalpp = {
    enable = lib.mkEnableOption "Xournalpp" // {default = cfg.enableMinimal;};
  };
  config = (lib.mkIf cfg.xournalpp.enable) {
    home.packages = [pkgs.xournalpp];
    home.file = {
      ".config/xournalpp/palette.gpl".source = ./palette.gpl;
      ".config/xournalpp/toolbar.ini".source = ./toolbar.ini;
      ".config/xournalpp/settings.xml".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/hm/packages/xournalpp/xournalpp-settings.xml";
    };
  };
}
