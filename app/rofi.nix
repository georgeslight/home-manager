{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    configPath = "~/.config/rofi/config.rasi";

    extraConfig = {
      modi = "drun, window, run";
      "icon-theme" = "Papirus-Dark";
    };
  };
}
