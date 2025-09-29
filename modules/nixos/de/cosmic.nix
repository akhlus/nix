{
  config,
  lib,
  ...
}: let
  cfg = config.nMods.de;
in {
  config = lib.mkIf (cfg.environment == "cosmic") {
    services.desktopManager.cosmic = {
      enable = true;
      xwayland.enable = true;
    };
    services.displayManager.cosmic-greeter.enable = !cfg.enableJovian;
  };
}
