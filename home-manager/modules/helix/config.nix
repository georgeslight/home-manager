{ config, pkfs, ... }:

{
  programs.helix = {
    settings = {
      theme = "tokyonight";

      editor = {
        line-number = "relative";
        cursorline = true;
        mouse = true;
        color-modes = true;

        lsp = {
          display-inlay-hints = true;
          # auto-signature-help = false; # Testing
          # display-messages = true; # Testing
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        inline-diagnostics = {
          cursor-line = "hint";
        };

        # Testing
        # indent-guides = {
        #   character = "|";
        #   render = true;
        # };

        # Testing
        # statusline = {
        #   left = [
        #     "mode"
        #     "spinner"
        #     "version-control"
        #     "file-name"
        #   ];
        # };
      };

      keys.normal = {
        # Lazygit
        "C-g" = [
          ":write-all"
          ":new"
          ":insert-output lazygit"
          ":buffer-close!"
          ":redraw"
          ":reload-all"
        ];
        # Yazi
        "C-y" = [
          ":sh rm -f /tmp/unique-file"
          ":insert-output yazi %{buffer_name} --chooser-file=/tmp/unique-file"
          '':insert-output echo "\x1b[?1049h\x1b[?2004h" > /dev/tty''
          ":open %sh{cat /tmp/unique-file}"
          ":redraw"
          ":set mouse false"
          ":set mouse true"
        ];

        space = {
          o = "file_picker_in_current_buffer_directory";
        };
        x = "select_line_below";
        X = "select_line_above";
      };

      keys.insert = {
        j.k = "normal_mode";
      };

    };
  };
}
