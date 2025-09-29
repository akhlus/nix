{username, ...}: {
  environment.variables = {
    SSH_AUTH_SOCK = "/Users/${username}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
  };
  services.openssh = {
    enable = true;
    extraConfig = ''
      AddressFamily any
      PermitRootLogin no
      UsePAM yes
      AcceptEnv LANG LC_* TERM EDITOR
      Include /etc/ssh/crypto.conf
    '';
  };
}
