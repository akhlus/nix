{
  config,
  lib,
  username,
  ...
}: let
  cfg = config.nMods.de;
in {
  config = lib.mkIf cfg.enableJovian {
    jovian = {
      decky-loader.enable = true;
      decky-loader.user = username;
      devices.steamdeck.enable = true;
      steam = {
        autoStart = cfg.enableAutoStartJovian;
        user = "sam";
        desktopSession = cfg.environment;
        enable = true;
        updater.splash = "vendor";
      };
      hardware.has.amd.gpu = true;
      steamos = {
        useSteamOSConfig = true;
      };
    };
  };
}
