{username, ...}: {
  imports = [
    ./boot.nix
    ./locale.nix
    ./nvidia.nix
  ];
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    ignoreShellProgramCheck = true;
  };
  hardware = {
    enableRedistributableFirmware = true;
    graphics.enable = true;
  };
  xdg.terminal-exec = {
    enable = true;
    settings.default = ["ghostty.desktop"];
  };
  networking.networkmanager.enable = true;
  system.stateVersion = "24.05";
}
