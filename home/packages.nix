{ config, pkgs, ...}:

{

 home.packages = with pkgs; [
   vesktop
   ani-cli
   prismlauncher

   browsh
  
   swaynotificationcenter   
   

   fastfetch
 
   #Hyprland
   swww
   pywal
   # nixos.wiki/wiki/Sway
   grim
   slurp
   wl-clipboard
   mako

 ];

}
