{username, ...}: {
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    casks = [
      "anki"
      #"autodesk-fusion"
      "bambu-studio"
      #"calibre"
      #"kicad"
      "kiwix"
      "ghostty"
      "zen"
    ];
    masApps = {
      "Bitwarden" = 1352778147;
    };
    onActivation.cleanup = "zap";
  };
}
