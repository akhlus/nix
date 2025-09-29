{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./nautilus.nix
    ./steam.nix
  ];
  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    inxi
    lm_sensors
    lshw
    pciutils
    usbutils
    v4l-utils
  ];
}
