{username, ...}: {
  nMods = {
    de.environment = "plasma";
    ssh.publicKey = "PUB_KEY";
  };

  home-manager.users.${username}.imports = [./home.nix];
}
