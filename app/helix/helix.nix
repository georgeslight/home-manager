{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./config.nix
    ./languages.nix
  ];

  home.packages = [
    # Go
    pkgs.gopls # Language Server
    pkgs.delve # Debugger
    pkgs.gotools # Go development tools (Formatter)
    pkgs.golangci-lint # Linter (for CLI)

    # Nix
    pkgs.nil
    pkgs.alejandra
    pkgs.nixfmt-rfc-style
  ];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    # package = pkgs-unstable.helix;
  };
}
