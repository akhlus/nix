{
  lib,
  pkgs,
  username,
  ...
}: {
  home = {
    username = username;
    homeDirectory = lib.mkForce (
      if pkgs.stdenv.isDarwin
      then "/Users/${username}"
      else "/home/${username}"
    );
    sessionPath = lib.optionals pkgs.stdenv.isDarwin ["/opt/homebrew/bin"];
    stateVersion = "24.11";
  };
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
  xdg.terminal-exec = {
    enable = true;
    settings.default = ["ghostty.desktop"];
  };
}
