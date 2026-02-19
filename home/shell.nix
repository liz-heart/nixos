{ config, lib, pkgs, ... }:
{
programs.git = {
  enable = true;
  userName = "liz-heart";
  userEmail = "dl@lojnik.net";
  extraConfig = {
    init.defaultBranch = "main";
    push.autoSetupRemote = true;
    pull.rebase = true;
    core.editor = "nvim";
    diff.colorMoved = "zebra";
  };
  delta = {
    enable = true;
    options = {
      side-by-side = true;
      line-numbers = true;
    };
  };
};
}
