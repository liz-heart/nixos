{ config, pkgs, ... } :
{
programs.bash = {
  enable = true;
  shellAliases = {
   logout = "kill -9 -1";
   ll = "ls -la";

   qs = "exec ~/.local/bin/start-quickshell.sh";
   kqs = "kill ~/.local/bin/start-quickshell.sh";

   en = "cd /etc/nixos"; 
   enh = "cd /etc/nixos/home"; 
   munch = "cd /home/munchnix"; 
 
   nrt = "sudo nixos-rebuild test";
   nrs = "sudo nixos-rebuild switch";


   xiv = "flatpak run dev.goats.xivlauncher";

 #  xiv = "DXVK_CONFIG='dxgi.syncInterval=0' XIVLauncher.Core ";
  };
 };
}

