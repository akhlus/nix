{
  config,
  lib,
  ...
}: let
  cfg = config.nMods.nvidia;
in {
  options.nMods.nvidia = {
    enable = lib.mkEnableOption "nvidia graphics" // {default = false;};
    package = lib.mkOption {
      type = lib.types.enum ["stable" "latest" "beta"];
      default = "latest";
      description = "Which release to use";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
    powerManagement.enable = true;
    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.${cfg.package};
    };
  };
}
