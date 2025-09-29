{
  config,
  lib,
  username,
  ...
}: let
  cfg = config.nMods.ssh;
in {
  options.nMods.ssh = {
    enableOpenSSH = lib.mkEnableOption "Enable OpenSSH" // {default = true;};
    enableFail2Ban = lib.mkEnableOption "Enable OpenSSH" // {default = true;};
    onlySSH = lib.mkEnableOption "Only use SSH to access machine" // {default = true;};
    portNumber = lib.mkOption {
      type = lib.types.ints.unsigned;
      default = 2222;
      description = "Which port to open";
    };
    publicKey = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Public key of the machine";
    };
    sshAuthSock = lib.mkOption {
      type = lib.types.str;
      default = "/home/${username}/.bitwarden-ssh-agent.sock";
      description = "Environment Variable SSH_AUTH_SOCK";
    };
  };
  config = {
    environment.variables = {SSH_AUTH_SOCK = cfg.sshAuthSock;};
    users.users.${username}.openssh.authorizedKeys.keys = [cfg.publicKey];
    services = {
      openssh = {
        enable = cfg.enableOpenSSH;
        ports = [cfg.portNumber];
        settings = {
          KbdInteractiveAuthentication = cfg.onlySSH;
          PasswordAuthentication = cfg.onlySSH;
          PermitRootLogin = "no";
        };
        extraConfig = ''
          AcceptEnv LANG LC_* TERM EDITOR
        '';
      };
      fail2ban.enable = cfg.enableFail2Ban;
    };
  };
}
