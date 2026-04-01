{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    vesktop
    ani-cli
    prismlauncher

    bottles
    protonplus
    protontricks
    winetricks
    wine

    unrar
    browsh

    swaynotificationcenter

    yazi

    bluez
    fastfetch
    gamescope
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
