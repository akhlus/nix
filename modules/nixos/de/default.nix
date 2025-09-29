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
    enableJovian = lib.mkEnableOption "Jovian - SteamOS equivalent" // {default = false;};
    enableAutoStartJovian = lib.mkEnableOption "Autostart for Jovian" // {default = config.nMods.de.enableJovian;};
    enableAutoLogin = lib.mkEnableOption "Auto Login";
  };
  config = {
    services.displayManager = {
      enable = lib.mkIf (!cfg.enable) false;
      autoLogin = lib.mkIf cfg.enableAutoLogin {
        enable = cfg.enableAutoLogin;
        user = username;
      };
    };
  };
}
