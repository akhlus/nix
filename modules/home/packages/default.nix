{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages;
  render-go = inputs.render-go.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  imports = [
    ./cli
    ./ghostty
    ./neovim
    ./vscode
    ./xournalpp
    ./zed
  ];
  options.hMods.packages = {
    enableMinimal =
      lib.mkEnableOption "minimal apps: browser, editor, terminal. Auto Enabled by default"
      // {default = true;};
    enableExtra =
      lib.mkEnableOption "extra apps - AI CLI and extra editors. Auto Enabled if linux apss are enabled"
      // {default = cfg.enableLinuxExtra;};
    enableLinuxExtra =
      lib.mkEnableOption "linux extra apps - disk stuff and office suite. Must be false on darwin systems"
      // {default = false;};
  };
  config = {
    home.packages = with pkgs;
      [
        alejandra
        dust
        fastfetch
        go
        gopls
        home-manager
        inter
        ibm-plex
        nano
        nerd-fonts.lilex
        nix-search-cli
        nixd
        python3
        render-go
        speedtest-cli
        tldr
      ]
      ++ (lib.optionals pkgs.stdenv.isDarwin [
        raycast
      ])
      ++ (lib.optionals cfg.enableMinimal [
        bitwarden
        brave
        firefox
      ])
      ++ (lib.optionals cfg.enableExtra [
        code-cursor
        discord
        gemini-cli
        google-chrome
        spotdl
        spotify
        yt-dlg
      ])
      ++ (lib.optionals cfg.enableLinuxExtra [
        anki
        baobab
        chromium
        gparted
        libreoffice
        protonvpn-gui
        vlc
      ]);
  };
}
