{
  config,
  inputs,
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
    sharedModules = [
      (inherit (import ../.) homeModules);
    ];
    users.${username} = {
      hMods.de.enablePM = isPlasma;
    };
  };
}
