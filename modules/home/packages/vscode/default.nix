{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages.vscode;
in {
  options.hMods.packages.vscode = {
    enable =
      lib.mkEnableOption "VSCode"
      // {default = config.hMods.packages.enableExtra;};
    package = lib.mkPackageOption pkgs "vscode" {
      nullable = false;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
