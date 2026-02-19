{ config, pkgs, ...}:

{

 home.packages = with pkgs; [
   vesktop
   ani-cli
   prismlauncher

   browsh

   fastfetch
   waybar
   # nixos.wiki/wiki/Sway
   grim
   slurp
   wl-clipboard
   mako

 ];


  programs.waybar.enable = true;  

}
