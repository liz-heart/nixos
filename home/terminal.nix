{ config, pkgs, ... } :
{
programs.alacritty = {
  enable = true;
  settings = {
   window.opacity = 0.9;
   window.blur = true;
  font = {
  normal = {
    family = "JetBrainsMono Nerd Font";
    style = "Regular";
  };
  bold = {
    family = "JetBrainsMono Nerd Font";
    style = "Bold";
  };
  italic = {
    family = "JetBrainsMono Nerd Font";
    style = "Italic";
  };
  size = 11.0;
};
  };
  };
 }
