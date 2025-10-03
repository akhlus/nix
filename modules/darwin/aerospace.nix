{
  config,
  lib,
  ...
}: let
  cfg = config.dMods.aerospace;
in {
  options.dMods.aerospace = {
    enable = lib.mkEnableOption "aerospace" // {default = true;};
    enableDefaults = lib.mkEnableOption "default settings" // {default = true;};
    extraSettings = lib.mkOption {
      description = "Extra settings to add";
      default = {};
    };
  };
  config = {
    services.aerospace = lib.mkIf cfg.enable {
      enable = cfg.enable;
      settings = builtins.fromTOML (builtins.readFile ./aerospace.toml);
    };
  };
}
