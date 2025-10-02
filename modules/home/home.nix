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
    sessionVariables =
      lib.mkIf (!pkgs.stdenv.isDarwin)
      {SSH_AUTH_SOCK = "/home/${username}/.bitwarden-ssh-agent.sock";};
    stateVersion = "24.11";
  };
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
}
