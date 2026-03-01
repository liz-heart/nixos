{ config, pkgs, ... } :
let 
  walls = "/home/munchnix/walls/sunflow.png";
in
{
 home.packages = with pkgs; [ swaybg ];

 wayland.windowManager.hyprland = {
  enable = true;
  extraConfig = ''
   monitor = DP-2, preferred, 0x0, 1
   monitor = DP-1, preferred, 2560x0, 1
   
   exec-once = swaybg -i ${walls} -m fill
  '' + builtins.readFile ./hyprland.conf; 
 };
}
