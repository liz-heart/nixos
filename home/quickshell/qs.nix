{ config, pkgs, ... }:
{
  home.file.".config/quickshell".source = ./.;

  home.file.".local/bin/start-quickshell.sh" = {
    executable = true;
    text = ''
      #!/bin/bash
      qs --config ${config.home.homeDirectory}/.config/quickshell
    '';
  };

  home.packages = with pkgs; [
    quickshell
  ];
}
