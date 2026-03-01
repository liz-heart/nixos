{ config, pkgs, ... } :
{
 imports = [
        ./hypr/hyprland.nix
        ./hypr/hyprlock.nix
	./scripts/scripts.nix	
	./quickshell/qs.nix
	./rofi.nix
	./wm.nix
	./terminal.nix
	./bash.nix
	./packages.nix
#	./swaylock.nix
	./shell.nix
 ];

 home.username = "munchnix";
 home.homeDirectory = "/home/munchnix";
 home.stateVersion = "25.11";

 home.packages = with pkgs; [];
 
 programs.git.enable = true;

 programs.neovim.enable = true;

 nixpkgs.config.allowUnfree = true;

}
