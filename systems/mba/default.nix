{username, ...}: {
  home-manager.users.${username} = {
    hMods.packages = {
      ghostty.package = null;
      enableExtra = true;
    };
  };
}
