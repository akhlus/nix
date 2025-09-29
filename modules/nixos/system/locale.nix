{
  config,
  lib,
  ...
}: let
  cfg = config.nMods.system;
in {
  options.nMods.system = {
    timezone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/London";
      description = "Timezone";
    };
    locale = lib.mkOption {
      type = lib.types.str;
      default = "en_GB.UTF-8";
      description = "Locale to use";
    };
  };

  config = {
    time.timeZone = cfg.timezone;
    console.keyMap = "uk";
    i18n = {
      defaultLocale = cfg.locale;
      extraLocaleSettings = {
        LC_ADDRESS = cfg.locale;
        LC_IDENTIFICATION = cfg.locale;
        LC_MEASUREMENT = cfg.locale;
        LC_MONETARY = cfg.locale;
        LC_NAME = cfg.locale;
        LC_NUMERIC = cfg.locale;
        LC_PAPER = cfg.locale;
        LC_TELEPHONE = cfg.locale;
        LC_TIME = cfg.locale;
      };
    };
  };
}
