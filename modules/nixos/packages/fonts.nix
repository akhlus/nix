{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      inter
      ibm-plex
      nerd-fonts.lilex
      noto-fonts-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Inter Variable"];
        sansSerif = ["Inter Variable"];
        monospace = ["Lilex Nerd Font Mono"];
      };
    };
  };
}
