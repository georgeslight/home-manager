{ config, pkgs, pkgs-unstable, ... }:

{
  programs.yazi = {
    enable = true;
    packags = pkgs-unstable.yazi;   

    settings = {
      flavor = "tokyonight";
    };

    flavors = {
      tokyonight = builtins.readFile (pkgs.fetchurl {
        url = "https://github.com/mingo99/tokyonight.yazi/blob/main/flavor.toml";
        hash = "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=";
      });
    };
  };
}
