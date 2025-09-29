{
  config,
  lib,
  ...
}: let
  cfg = config.hMods.flatpak;
in {
  options.hMods.flatpak = {
    enable = lib.mkEnableOption "flatpak";
    enableDefaultApps = lib.mkEnableOption "default apps for flatpak (bitwarden, brave, discord, spotify)";
    extraApps = lib.mkOption {
      default = [];
      example = ["com.brave.Browser"];
      description = "List of extra apps to install from flatpak";
      type = lib.types.listOf lib.types.str;
    };
  };
  config = lib.mkIf cfg.enable {
    services.flatpak = {
      update.auto.enable = true;
      uninstallUnmanaged = true;
      packages =
        (lib.optionals cfg.enableDefaultApps [
          "com.bitwarden.desktop"
          "com.brave.Browser"
          "com.discordapp.Discord"
          "com.spotify.Client"
        ])
        ++ cfg.extraApps;
    };
  };
}
