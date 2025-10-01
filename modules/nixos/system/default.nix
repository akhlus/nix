{
  flakePath,
  hostname,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./boot.nix
    ./locale.nix
    ./nvidia.nix
  ];
  environment.variables = {
    FLAKE_PATH = "${flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
  };
  users.users.${username} = {
    name = "${username}";
    description = username;
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
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
  networking = {
    networkmanager.enable = true;
    hostName = hostname;
  };
  system.stateVersion = "24.05";
}
