{ config, pkgs, ... } :
{
programs.bash = {
  enable = true;
  shellAliases = {

   ll = "ls -la";


   en = "cd /etc/nixos"; 

   enh = "cd /etc/nixos/home"; 
 
   nrt = "sudo nixos-rebuild test";
   nrs = "sudo nixos-rebuild switch";


  xiv = "flatpak run dev.goats.xivlauncher";

  };
 };
}

