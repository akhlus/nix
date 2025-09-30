{
  specialArgs,
  ...
}: {
  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    useGlobalPkgs = true;
    sharedModules = [ ../home];
  };
}
