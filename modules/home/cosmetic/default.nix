{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.cosmetic;
in {
  options.hMods.cosmetic = {
    themeFile = lib.mkOption {
      type = lib.types.path;
      default = ./theme.toml;
      description = "Path to the theme TOML fie";
    };
    theme = lib.mkOption {
      type = lib.types.attrs;
      default = builtins.fromTOML (builtins.readFile cfg.themeFile);
      description = "Attr set of theme variables automatically read from the themeFile provided";
    };
    background = lib.mkOption {
      type = lib.types.path;
      default = ./cassiopeia.png;
      description = "Path to the file to use as background";
    };
    backgroundFile = lib.mkOption {
      type = lib.types.str;
      default = "Pictures/bg.png";
      description = "Where the background should be located with in the home folder";
    };
    enableCursor = lib.mkEnableOption "cursor management" // {default = !pkgs.stdenv.isDarwin;};
    cursorPackage = lib.mkOption {
      type = lib.types.pkgs;
      default = pkgs.afterglow-cursors-recolored;
      description = "Which package to use for the cursor";
    };
    cursorName = lib.mkOption {
      description = "Name of cursor";
      type = lib.types.str;
      default = "Afterglow-Recolored-Catppuccin-Macchiato";
    };
    cursorSize = lib.mkOption {
      description = "Size of cursor to use";
      type = lib.types.int;
      default = 24;
    };
  };
  config = {
    home.file = {${cfg.backgroundFile}.source = cfg.background;};
    home.pointerCursor = lib.mkIf cfg.enableCursor {
      gtk.enable = true;
      x11.enable = true;
      package = cfg.cursorPackage;
      name = cfg.cursorName;
      size = cfg.cursorSize;
    };
  };
}
