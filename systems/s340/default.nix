{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware.nix
  ];
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [virtiofsd];
  };
  programs.virt-manager.enable = true;
  users.users.sam.extraGroups = ["libvirtd"];
  nMods = {
    de.environment = "plasma";
    ssh.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILVmDsq/cQ+Tc5Pd5HR7vvZ22gLsMh4afo5eN/08H75O s340";
  };
  home-manager.users.${username} = {
    hMods.packages = {
      enableLinuxExtra = true;
    };
    home.packages = [pkgs.protonvpn-gui];
  };
}
