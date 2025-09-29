{
  config,
  lib,
  pkgs,
  username,
  ...
}: let
  cfg = config.nMods.de;
in {
  config = lib.mkIf (cfg.environment == "gnome") {
    environment = {
      systemPackages =
        (with pkgs; [
          gnome-tweaks
          dconf2nix
          dconf-editor
          gnome-extension-manager
        ])
        ++ (with pkgs.gnomeExtensions; [
          appindicator
          blur-my-shell
          caffeine
          clipboard-indicator
          dash-to-dock
          dash-to-panel
          tiling-shell
        ]);
      gnome.excludePackages = with pkgs; [
        gnome-backgrounds
        totem
      ];
    };
    home-manager.users.${username}.imports = [./dconf.nix];
    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };
    services = {
      displayManager.gdm.enable = !config.nMods.de.enableJovian;
      desktopManager.gnome.enable = true;
      power-profiles-daemon.enable = lib.mkDefault true;
      gnome.gnome-keyring.enable = true;
      udev.packages = [pkgs.gnome-settings-daemon];
    };
  };
}
