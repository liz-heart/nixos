{ config, pkgs, ... }:
{
  imports = [
    ./hypr/hyprland.nix
    ./hypr/hyprlock.nix
    ./scripts/scripts.nix
    ./quickshell/qs.nix
    #    ./rofi.nix
    #    ./wm.nix
    ./terminal.nix
    ./bash.nix
    ./packages.nix
    #	./swaylock.nix
    ./shell.nix
    ./nvim.nix
    ./yazi.nix
    ./vscodium.nix
  ];

  home.username = "munchnix";
  home.homeDirectory = "/home/munchnix";
  home.stateVersion = "25.11";

  programs.git.enable = true;

}
