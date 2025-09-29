{
  config,
  flakePath,
  lib,
  ...
}: let
  cfg = config.hMods.packages.shell;
  alias = {
    "la" = "ls -a";
    "lt" = "eza --tree --level=2 --long --git";
    "lta" = "lt -a";
    "py" = "python3";
    "nrb" = "sh ${flakePath}/update.sh -p ${flakePath}";
  };
in {
  options.hMods.packages.shell = {
    enableZsh = lib.mkEnableOption "Enable zsh" // {default = true;};
    enableBash = lib.mkEnableOption "Enable bash" // {default = true;};
  };
  config = {
    programs = {
      zsh = {
        enable = cfg.enableZsh;
        shellAliases = alias;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh.enable = true;
      };
      bash = {
        enable = cfg.enableBash;
        shellAliases = alias;
      };
    };
    home.shell = {
      enableBashIntegration = cfg.enableBash;
      enableZshIntegration = cfg.enableZsh;
    };
  };
}
