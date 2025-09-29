{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nMods.nautilus;
in {
  options.nMods.nautilus = {
    enable = lib.mkEnableOption "Enable nautilus" // {default = true;};
  };
  config = lib.mkIf cfg.enable {
    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "ghostty";
    };
    services.gnome.sushi.enable = true;
    environment.systemPackages = [pkgs.nautilus];
  };
}
