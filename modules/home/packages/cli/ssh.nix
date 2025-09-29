{...}: {
  home.file.".ssh/pubKeys" = {
    source = ./pubKeys;
    recursive = true;
  };
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "u410" = {
        hostname = "192.168.10.10";
        user = "u410";
        port = 2222;
        identityFile = "~/.ssh/pubKeys/u410.pub";
      };
      "a3" = {
        hostname = "192.168.10.11";
        user = "sam";
        port = 2222;
        identityFile = "~/.ssh/pubKeys/a3.pub";
      };
      "duet3" = {
        hostname = "192.168.10.13";
        user = "sam";
        port = 2222;
        identityFile = "~/.ssh/pubKeys/duet3.pub";
      };
      "mba" = {
        hostname = "192.168.10.14";
        user = "sam";
        port = 22;
        identityFile = "~/.ssh/pubKeys/mba.pub";
      };
      "*" = {};
    };
    extraConfig = ''
      SendEnv EDITOR TERM LANG LC_*
    '';
  };
}
