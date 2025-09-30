{config, inputs, pkgs, ...}: {
  # flatpak example config
  services.flatpak = {
    update.auto.enable = true;
    uninstallUnmanaged = true;
    packages = [
      "com.bitwarden.desktop"
      "com.brave.Browser"
      "com.discordapp.Discord"
      "com.spotify.Client"
    ];
  };
  # nixgl example config including wrapping ghostty package
  nixGL = {
    packages = inputs.nixGL.packages;
    installScripts = ["mesa"];
  };
  hMods.packages = {
    ghostty = {
      enable = true;
      package = config.lib.nixGL.wrap pkgs.ghostty;
    };
  };
}
