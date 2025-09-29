{...}: {
  programs = {
    gh.enable = true;
    git = {
      enable = true;
      userName = "akhlus";
      userEmail = "93236986+akhlus@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = "true";
        push.autoSetupRemote = "true";
      };
    };
  };
}
