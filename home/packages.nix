{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    # games & co
    vesktop
    ani-cli
    prismlauncher

    # ide
    jetbrains-toolbox
    bruno
    bruno-cli

    # compabilty force
    bottles
    protonplus
    protontricks
    winetricks
    wine

    # files
    yazi
    unrar
    browsh

    # wm & co
    fastfetch
    bluez
    swaynotificationcenter
    gamescope
    swww
    pywal
    grim
    slurp
    wl-clipboard
    mako

  ];

}
