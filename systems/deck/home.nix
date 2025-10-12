{
  config,
  inputs,
  pkgs,
  ...
}: {
  nixGL = {
    packages = inputs.nixgl.packages;
    installScripts = ["mesa"];
  };

  services.flatpak = {
    enable = true;
    update.auto.enable = true;
    uninstallUnmanaged = true;
    packages = [
      "com.bitwarden.desktop"
      "com.brave.Browser"
      "com.spotify.Client"
    ];
  };

  hMods = {
    de.enablePM = true;
    packages = {
      enableMinimal = false;
      ghostty = {
        enable = true;
        package = config.lib.nixGL.wrap pkgs.ghostty;
      };
      vscode.enable = true;
      xournalpp.enable = true;
    };
  };
}
