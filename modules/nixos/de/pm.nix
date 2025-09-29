{
  config,
  pkgs,
  username,
  ...
}: {
  programs = let
    mkFont = family: size: {
      inherit family;
      pointSize = size;
    };
  in {
    okular = {
      enable = true;
      general = {
        openFileInTabs = true;
        smoothScrolling = true;
        zoomMode = "fitWidth";
      };
    };
    plasma = {
      enable = true;
      configFile = {
        "kdeglobals"."General"."TerminalApplication" = "${pkgs.ghostty}/bin/ghostty --gtk-single-instance=true";
        "kdeglobals"."General"."TerminalService" = "com.mitchellh.ghostty.desktop";
        "kdeglobals"."KDE"."AnimationDurationFactor" = 0;
        "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
      };
      fonts = {
        fixedWidth = mkFont "Lilex Nerd Font Mono" 12;
        general = mkFont "IBM Plex Sans" 12;
        menu = mkFont "IBM Plex Sans" 12;
        small = mkFont "IBM Plex Sans" 9;
        toolbar = mkFont "IBM Plex Sans" 12;
        windowTitle = mkFont "IBM Plex Sans" 12;
      };
      input.keyboard.options = ["caps:escape"];
      krunner = {
        position = "center";
        shortcuts.launch = "Meta+Space";
      };
      kwin = {
        effects = {
          blur = {
            enable = true;
            noiseStrength = 5;
            strength = 10;
          };
          desktopSwitching = {
            animation = "off";
            navigationWrapping = true;
          };
          minimization.animation = "off";
          shakeCursor.enable = true;
          translucency.enable = true;
          windowOpenClose.animation = "off";
        };
        nightLight.enable = false;
        titlebarButtons = {
          left = ["close" "minimize" "maximize"];
          right = [];
        };
        virtualDesktops.number = 4;
      };
      panels = [
        {
          hiding = "dodgewindows";
          lengthMode = "fit";
          location = "top";
          opacity = "translucent";
          widgets = [
            {
              kickoff = {
                sortAlphabetically = true;
                icon = "nix-snowflake-white";
              };
            }
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.systemtray"
          ];
        }
      ];
      session = {
        general.askForConfirmationOnLogout = false;
      };
      shortcuts = {
        "kwin"."Switch to Desktop 1" = "Meta+1";
        "kwin"."Switch to Desktop 2" = "Meta+2";
        "kwin"."Switch to Desktop 3" = "Meta+3";
        "kwin"."Switch to Desktop 4" = "Meta+4";
        "kwin"."Window Close" = "Meta+Q";
        "plasmashell"."activate task manager entry 1" = "";
        "plasmashell"."activate task manager entry 2" = "";
        "plasmashell"."activate task manager entry 3" = "";
        "plasmashell"."activate task manager entry 4" = "";
        "plasmashell"."activate task manager entry 5" = "";
        "plasmashell"."activate task manager entry 6" = "";
        "plasmashell"."activate task manager entry 7" = "";
        "plasmashell"."activate task manager entry 8" = "";
        "plasmashell"."activate task manager entry 9" = "";
        "plasmashell"."manage activities" = "";
        "services/com.mitchellh.ghostty.desktop"."_launch" = "Meta+Return";
        "services/org.kde.dolphin.desktop"."_launch" = "Meta+F";
        "services/org.kde.konsole.desktop"."_launch" = [];
        "services/org.kde.krunner.desktop"."_launch" = "Meta+Space";
        "services/org.kde.plasma-systemmonitor.desktop"."_launch" = [];
        "services/org.kde.plasma.emojier.desktop"."_launch" = "Meta+Ctrl+Alt+Shift+Space";
      };
      spectacle.shortcuts = {
        launch = "Meta+Shift+S";
        recordRegion = "";
        recordScreen = "";
        recordWindow = "";
      };
      windows.allowWindowsToRememberPositions = true;
      workspace = {
        enableMiddleClickPaste = true;
        colorScheme = "BreezeDark";
        wallpaper = "/home/${username}/${config.hMods.cosmetic.backgroundFile}";
        wallpaperFillMode = "stretch";
      };
    };
  };
}
