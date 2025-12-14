{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

{
  imports = [
    ./config.nix
    ./languages.nix
  ];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    # package = pkgs-unstable.helix;
  };
  
  home.packages = [
    # Go
    pkgs.gopls # Language Server
    pkgs.delve # Debugger
    pkgs.gotools # Go development tools (Formatter)
    pkgs.golangci-lint # Linter (for CLI)
    # Go Templ
    pkgs.templ

    # Nix
    pkgs.nil
    pkgs.alejandra
    pkgs.nixfmt-rfc-style

    # Bash
    pkgs.bash-language-server
    # CSS ESLint HTML JSON MD
    pkgs.vscode-langservers-extracted
    # JS TS
    pkgs.typescript-language-server
    # TailwindCSS
    pkgs.tailwindcss-language-server
    # MD
    pkgs.marksman
    # Hypr
    pkgs.hyprls
    # TOML
    pkgs.taplo
    # YAML
    pkgs.yaml-language-server
    # Docker
    pkgs.docker-compose-language-service
    pkgs.dockerfile-language-server-nodejs
    # SQL
    pkgs.python313Packages.sqlparse

    # TODO georges check scooter for project wide search
  ];

  # # For Remap Caps-Lock to Esc
  # services.keyd = {
  #   enable = true;
  #   package = pkgs.keyd;
  #   keyboards.default = {
  #     ids = [ "*" ];
  #     settings = {
  #       main = {
  #         # Maps capslock to escape when pressed and control when held.
  #         capslock = "overload(control, esc)";
  #         # Remaps the escape key to capslock
  #         esc = "capslock";
  #       };
  #     };
  #   };
  # };
}
