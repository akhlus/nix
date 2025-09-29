{
  config,
  lib,
  ...
}: let
  cfg = config.nMods.steam;
in {
  options.nMods.steam = {
    enable = lib.mkEnableOption "Enable Steam" // {default = false;};
  };
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = cfg.enable;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
