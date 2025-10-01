{
  config,
  lib,
  ...
}: let
  cfg = config.hMods.de;
in {
  imports =
    lib.optionals cfg.enableDconf [./dconf.nix]
    ++ lib.optionals cfg.enablePM [./pm.nix];
  options.hMods.de = {
    enableDconf = lib.mkEnableOption "dconf settings management" // {default = false;};
    enablePM = lib.mkEnableOption "plasma-manager file" // {default = false;};
  };
}
