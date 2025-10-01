{
  config,
  lib,
  username,
  ...
}: let
  cfg = config.nMods.de;
in {
  imports = [
    ./cosmic.nix
    ./gnome.nix
    ./jovian.nix
    ./plasma.nix
  ];
  options.nMods.de = {
    enable = lib.mkEnableOption "graphics" // {default = true;};
    environment = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum ["gnome" "plasma" "cosmic"]);
      description = "Environment choice";
      default = null;
    };
    enableAutoLogin = lib.mkEnableOption "Auto Login";
    enableDM = lib.mkEnableOption "Enable Display Manager for chosen environment" // {default = true;};
  };
  config = {
    services.displayManager = {
      enable = cfg.enable;
      autoLogin = lib.mkIf cfg.enableAutoLogin {
        enable = cfg.enableAutoLogin;
        user = username;
      };
    };
  };
}
