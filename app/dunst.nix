{ config, pkgs, ... }:

{
  programs.dunst = {
    package = pkgs.dunst;
  };
  
}
