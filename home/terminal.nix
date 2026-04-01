{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      # Window appearance
      background_opacity = "0.5"; # must be string
      background_blur = 1; # kitty uses an integer blur radius
      # Font settings
      font_family = "JetBrainsMono Nerd Font";
      bold_font = "JetBrainsMono Nerd Font Bold";
      italic_font = "JetBrainsMono Nerd Font Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Bold Italic";
      font_size = 11.0;
    };

    extraConfig = ''
      # Load current pywal colors so NEW kitty windows match the wallpaper
      include ~/.cache/wal/colors-kitty.conf
    '';
  };
}
