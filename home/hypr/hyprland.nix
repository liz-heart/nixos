{ config, pkgs, ... }:
let
  dynamicWallpaper = "${config.home.homeDirectory}/.cache/current_wallpaper";
in
{
  home.packages = with pkgs; [ swaybg ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      monitor = DP-2, preferred, 0x0, 1
      monitor = DP-1, preferred, 2560x0, 1

      exec-once = swaybg -i ${dynamicWallpaper} -m fill
    ''
    + builtins.readFile ./hyprland.conf;
  };
}
