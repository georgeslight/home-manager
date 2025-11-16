{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  imports = [
    ./app/helix/helix.nix  
  ];
  
  home.username = "ligero";
  home.homeDirectory = "/home/ligero";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    
    # Dev
    go
    
    pkgs-unstable.wiremix

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # programs.helix = {
  #   enable = true;
  #   package = inputs.helix.packages.${pkgs.system}.default;
  #   # package = pkgs-unstable.helix; 

  #   settings = {
  #     theme = "tokyonight";

  #     keys.normal = {
  #       # Lazygit
  #       "C-g" = [":new" ":insert-output lazygit" ":buffer-close!" ":redraw" ":rla"];
  #       # Yazi
  #       "C-y" = [
  #       ":sh rm -f /tmp/unique-file"
  #       ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
  #       ":insert-output echo \"\\x1b[?1049h\\x1b[?2004h\" > /dev/tty"
  #       ":open %sh{cat /tmp/unique-file}"
  #       ":redraw"
  #       ":set mouse false"
  #       ":set mouse true"
  #     ];
        
  #     };
      
  #     editor = {
  #       lsp.display-inlay-hints = true;
  #       line-number = "relative";
  #       cursorline = true;
  #       mouse = false;
  #       color-modes = true;
  #     };
      
  #     editor.cursor-shape = {
  #       insert = "bar";
  #       normal = "block";
  #       select = "underline";
  #     };
      
  #     editor.inline-diagnostics = {
  #       cursor-line = "hint";
  #     };
      
  #     keys.insert = {
  #       j.k = "normal_mode";
  #     };
      
  #     keys.normal.space = {
  #       o = "file_picker_in_current_buffer_directory";
  #     };
      
  #   };
  # };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ligero/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
