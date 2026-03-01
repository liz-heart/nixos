{ config, pkgs, quickshell, ... }:
{
  home.file.".config/quickshell".source = ./.;

  home.file.".local/bin/start-quickshell.sh" = {
    executable = true;
    text = ''
      #!${pkgs.bash}/bin/bash
      qs --config ${config.home.homeDirectory}/.config/quickshell
    '';
  };

  home.packages = [
    (quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default.withModules [
      pkgs.qt6Packages.qt5compat
    ])
  ];
}
