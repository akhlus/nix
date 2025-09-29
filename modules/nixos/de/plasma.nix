{
  config,
  inputs,
  lib,
  pkgs,
  username,
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
    home-manager = {
      sharedModules = [inputs.plasma-manager.homeModules.plasma-manager];
      users.${username}.imports = [./pm.nix];
    };
    services = {
      displayManager.sddm = {
        enable = !cfg.enableJovian;
        wayland.enable = true;
      };
      desktopManager.plasma6.enable = true;
    };
  };
}
