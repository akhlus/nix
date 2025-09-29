{
  flakePath,
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
    sessionVariables = {FLAKE_PATH = "${flakePath}";};
    stateVersion = "24.11";
  };
}
