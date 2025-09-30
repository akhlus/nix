{
  pkgs,
  username,
  ...
}: {
  users.users.${username} = {
    description = username;
    name = "${username}";
    shell = pkgs.zsh;
  };
}
