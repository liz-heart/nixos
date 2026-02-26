{ config, pkgs, ... }:
{
 home.packages = with pkgs; [ swaybg ];

 wayland.windowManager.sway = {
 enable = true;
 checkConfig = false;
 config = rec {
  modifier = "Mod4";
  terminal = "alacritty";
  output = {
	"DP-2" = {
	position = "0 0";
	bg = "/home/munchnix/walls/sunflow.png fill";
	};
	"DP-1" = {
	position = "2560 0";
	bg = "/home/munchnix/walls/sunflow.png fill";
	};
#   	bg = "/home/munchnix/walls/2B.jpg fill";
#    	bg = "/home/munchnix/walls/angel.jpg fill";
#    	bg = "/home/munchnix/walls/frieren.png fill"; 
    };
 
 keybindings = {
  "${modifier}+Alt+l" = "exec hyprlock";
  # all defaults explicitly written out
  "${modifier}+Return" = "exec alacritty";
  "${modifier}+Shift+q" = "kill";
  "${modifier}+d" = "exec rofi -show drun";
  "${modifier}+Shift+c" = "reload";
  # "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Exit sway?' -B 'Yes' 'swaymsg exit'";

  # focus
  "${modifier}+Left" = "focus left";
  "${modifier}+Down" = "focus down";
  "${modifier}+Up" = "focus up";
  "${modifier}+Right" = "focus right";
  "${modifier}+h" = "focus left";
  "${modifier}+j" = "focus down";
  "${modifier}+k" = "focus up";
  "${modifier}+l" = "focus right";

  # move
  "${modifier}+Shift+Left" = "move left";
  "${modifier}+Shift+Down" = "move down";
  "${modifier}+Shift+Up" = "move up";
  "${modifier}+Shift+Right" = "move right";
  "${modifier}+Shift+h" = "move left";
  "${modifier}+Shift+j" = "move down";
  "${modifier}+Shift+k" = "move up";
  "${modifier}+Shift+l" = "move right";

  # layout
  "${modifier}+b" = "splith";
  "${modifier}+v" = "splitv";
  "${modifier}+s" = "layout stacking";
  "${modifier}+w" = "layout tabbed";
  "${modifier}+e" = "layout toggle split";
  "${modifier}+f" = "fullscreen toggle";

  # floating
  "${modifier}+Shift+space" = "floating toggle";
  "${modifier}+space" = "focus mode_toggle";

  # scratchpad
  "${modifier}+Shift+minus" = "move scratchpad";
  "${modifier}+minus" = "scratchpad show";

  # workspaces
  "${modifier}+1" = "workspace number 1";
  "${modifier}+2" = "workspace number 2";
  "${modifier}+3" = "workspace number 3";
  "${modifier}+4" = "workspace number 4";
  "${modifier}+5" = "workspace number 5";
  "${modifier}+6" = "workspace number 6";
  "${modifier}+7" = "workspace number 7";
  "${modifier}+8" = "workspace number 8";
  "${modifier}+9" = "workspace number 9";
  "${modifier}+0" = "workspace number 10";

  # move to workspace
  "${modifier}+Shift+1" = "move container to workspace number 1";
  "${modifier}+Shift+2" = "move container to workspace number 2";
  "${modifier}+Shift+3" = "move container to workspace number 3";
  "${modifier}+Shift+4" = "move container to workspace number 4";
  "${modifier}+Shift+5" = "move container to workspace number 5";
  "${modifier}+Shift+6" = "move container to workspace number 6";
  "${modifier}+Shift+7" = "move container to workspace number 7";
  "${modifier}+Shift+8" = "move container to workspace number 8";
  "${modifier}+Shift+9" = "move container to workspace number 9";
  "${modifier}+Shift+0" = "move container to workspace number 10";
};
 };
 
 

 extraConfig = ''
  for_window [app_id="Alacritty"] opacity 0.9
 '';
};
}

