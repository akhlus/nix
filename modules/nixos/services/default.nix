{...}: {
  imports = [./ssh.nix];
  security.rtkit.enable = true;
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
    fwupd.enable = true;
    libinput.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
    pulseaudio.enable = false;
    xserver.xkb = {
      layout = "gb";
      variant = "";
    };
  };
}
