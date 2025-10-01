{username, ...}: {
  nix = {
    gc = {
      automatic = true;
      options = "-d";
    };
    optimise.automatic = true;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = [username];
    };
  };
  nixpkgs.config.allowUnfree = true;
}
