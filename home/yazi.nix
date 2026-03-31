{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    settings = {
      manager = {
        sort_by = "natural";
        show_hidden = true;
      };
    };

    keybindings = {
      q = "quit";
      d = "delete";
      c = "copy";
      m = "move";
    };
  };
}
