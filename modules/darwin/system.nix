{
  pkgs,
  username,
  ...
}: {
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = "${username}";
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        PMPrintingExpandedStateForPrint = true;
        _HIHideMenuBar = true;
        "com.apple.trackpad.forceClick" = false;
      };
      WindowManager = {
        AppWindowGroupingBehavior = false;
        AutoHide = true;
        EnableStandardClickToShowDesktop = false;
        EnableTiledWindowMargins = false;
        EnableTilingByEdgeDrag = true;
        GloballyEnabled = false;
        HideDesktop = true;
        StageManagerHideWidgets = true;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };
      controlcenter = {
        BatteryShowPercentage = true;
        Sound = false;
        NowPlaying = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        expose-animation-duration = 0.0;
        largesize = 16;
        launchanim = false;
        magnification = false;
        mineffect = "scale";
        minimize-to-application = true;
        persistent-apps = [
          {app = "${pkgs.brave}/Applications/Brave Browser.app";}
          {app = "${pkgs.zed-editor}/Applications/Zed.app";}
          {app = "/Applications/Ghostty.app";}
          {app = "${pkgs.spotify}/Applications/Spotify.app";}
        ];
        show-process-indicators = true;
        show-recents = false;
        showhidden = true;
        tilesize = 34;
      };
      finder = {
        AppleShowAllFiles = true;
        CreateDesktop = false;
        NewWindowTarget = "Home";
        ShowExternalHardDrivesOnDesktop = false;
        ShowHardDrivesOnDesktop = false;
        ShowPathbar = true;
        ShowRemovableMediaOnDesktop = false;
      };
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  system.stateVersion = 6;
}
