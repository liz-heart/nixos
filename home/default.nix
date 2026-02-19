{ config, pkgs, ... } :
{
 imports = [
	./wm.nix
	./terminal.nix
	./bash.nix
	./packages.nix
	./swaylock.nix
	./shell.nix
#	./waybar.nix
 ];

 home.username = "munchnix";
 home.homeDirectory = "/home/munchnix";
 home.stateVersion = "25.11";

 home.packages = with pkgs; [
 bat
 ];
 
 programs.git.enable = true;

 programs.neovim.enable = true;

 nixpkgs.config.allowUnfree = true;

}
