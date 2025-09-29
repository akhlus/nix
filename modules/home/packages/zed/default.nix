{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages.zed;
  akhlusTheme = (import ./theme.nix {inherit config lib;}).themeOut;
in {
  options.hMods.packages.zed = {
    enable = lib.mkEnableOption "Zed" // {default = config.hMods.packages.enableMinimal;};
    package = lib.mkPackageOption pkgs "zed-editor" {
      nullable = false;
    };
  };
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/hm/packages/zed/zed-settings.json";
    };
    programs.zed-editor = {
      enable = cfg.enable;
      extraPackages = [pkgs.nixd];
      installRemoteServer = true;
      package = cfg.package;
      themes = {akhlus = akhlusTheme;};
    };
  };
}
