{username, ...}: {
  #darwin configuration goes here

  home-manager.users.${username} = {
    #home config goes here
    hMods.packages = {
      ghostty.package = null;
      enableExtra = true;
    };
  };
}
