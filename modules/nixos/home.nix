{
  config,
  specialArgs,
  username,
  ...
}: let
  cfg = config.nMods.de.environment;
  isPlasma = cfg == "plasma";
in {
  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    useGlobalPkgs = true;
    sharedModules = [../home];
    users.${username} = {
      hMods.de.enablePM = isPlasma;
    };
  };
}
