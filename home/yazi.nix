{ config, pkgs, ... }:

{
  # Install Yazi
  home.packages = with pkgs; [
    yazi
  ];

  # Main Yazi config
  xdg.configFile."yazi/yazi.toml".text = ''
    [manager]
    sort_by = "natural"
    show_hidden = true
  '';

  # Keybindings (optional)
  xdg.configFile."yazi/keymap.toml".text = ''
    [manager]
    q = "quit"
    d = "delete"
    c = "copy"
    m = "move"
  '';
}
