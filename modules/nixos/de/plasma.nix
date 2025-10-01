{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nMods.de;
in {
  config = lib.mkIf (cfg.environment == "plasma") {
    environment = {
      systemPackages = with pkgs; [
        kdePackages.partitionmanager
        maliit-keyboard
      ];
      plasma6.excludePackages = with pkgs.kdePackages; [
        elisa
        kate
        konsole
        plasma-browser-integration
      ];
    };
    services = {
      displayManager.sddm = {
        enable = cfg.enableDM;
        wayland.enable = true;
      };
      desktopManager.plasma6.enable = true;
    };
  };
}
