{
  config,
  lib,
  ...
}: let
  cfg = config.dMods.aerospace;
in {
  options.dMods.aerospace = {
    enable = lib.mkEnableOption "aerospace" // {default = true;};
  };
  config = {
    services.aerospace = lib.mkIf cfg.enable {
      enable = cfg.enable;
      settings = builtins.fromTOML (builtins.readFile ./aerospace.toml);
    };
  };
}
