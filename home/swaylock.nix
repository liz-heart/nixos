{ config, pkgs, ...}:
{
	home.packages = with pkgs; [ swaylock-effects ];
	catppuccin.swaylock = {
	 enable = true;
	 flavor = "mocha";
	};

	programs.swaylock = {
	enable = true;
	package = pkgs.swaylock-effects;
	settings = {
	 clock = true;
	 timestr = "%H:%M";
	 datestr = "%a, %d, %B";
	 indicator = true;
	 indicator-radius = 100;
	 indicator-thickness = 10;
	 font = "JetBrainsMono Nerd Font";
	 };
	};

}
