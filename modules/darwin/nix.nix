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
    registry."akhlus".to = {
      owner = "akhlus";
      repo = "nix";
      type = "github";
    };
  };
  nixpkgs.config.allowUnfree = true;
}
