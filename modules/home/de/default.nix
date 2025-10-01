{
  config,
  lib,
  ...
}: let
  cfg = config.hMods.de;
in {
  imports = [
    ./dconf.nix
    ./pm.nix
  ];
  options.hMods.de = {
    enableDconf = lib.mkEnableOption "dconf settings management" // {default = false;};
    enablePM = lib.mkEnableOption "plasma-manager file" // {default = false;};
  };
}
