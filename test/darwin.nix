{username, ...}: {
  #darwin configuration goes here
  dMods.ssh.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFQjvsEOeipx+aSfrT6WIEdrlMxfglSgOu2NKmpzTUA";

  home-manager.users.${username} = {
    #home config goes here
    hMods.packages = {
      ghostty.package = null;
      enableExtra = true;
    };
  };
}
