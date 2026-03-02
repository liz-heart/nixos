{ config, lib, pkgs, ... }:
{
programs.git = {
  enable = true;
  settings = {
    user.Name = "liz-heart";
    user.Email = "dl@lojnik.net";
    init.defaultBranch = "main";
    push.autoSetupRemote = true;
    pull.rebase = true;
    core.editor = "nvim";
    diff.colorMoved = "zebra";
  };
}; 
programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
      line-numbers = true;
    };
  };
}

