{lib, ...}: {
  imports = [
    ./dconf.nix
    ./pm.nix
  ];
  options.hMods.de = {
    enableDconf = lib.mkEnableOption "dconf settings management";
    enablePM = lib.mkEnableOption "plasma-manager file";
  };
}
