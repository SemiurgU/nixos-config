{pkgs, ...}: {
  programs.helix = {
    enable = true;

    themes = {
      thorn_base16 = {
        inherits = "base16_transparent"; # Use base16 template
        "ui.background" = {bg = "#152326";};
        "ui.cursorline.primary" = {bg = "#1c2b2e";};
        "ui.cursorline.secondary" = {bg = "#1c2b2e";};
        palette = {
          base00 = "#152326";
          base01 = "#1c2b2e";
          base02 = "#263338";
          base03 = "#3b4b52";
          base04 = "#70848f";
          base05 = "#91a4ad";
          base06 = "#a7b8c2";
          base07 = "#c2d1d9";
          base08 = "#ff5b61";
          base09 = "#ffcf99";
          base0A = "#fdd9af";
          base0B = "#9dc6a9";
          base0C = "#f9ada1";
          base0D = "#86bfd2";
          base0E = "#d59cce";
          base0F = "#d48588";
        };
      };
    };
    settings = {
      theme = "thorn_base16";
      editor = {
        color-modes = true;
        preview-completion-insert = true;
        completion-replace = true;
        auto-info = true;
        true-color = true;
        cursorline = true;
        auto-pairs = true;

        lsp = {
          auto-signature-help = true;
          display-messages = true;
          display-inlay-hints = true;
        };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.alejandra}/bin/alejandra";
          language-servers = [
            "nil"
            "nixd"
          ];
        }
        {
          name = "markdown";
          language-servers = ["marksman"];
          formatter = {
            command = "${pkgs.prettier}/bin/prettier";
            args = ["--parser" "markdown"];
          };
          auto-format = true;
        }
        {
          name = "kdl";
          formatter = {
            command = "${pkgs.kdlfmt}/bin/kdlfmt";
            args = ["format" "--stdin"];
          };
          auto-format = true;
        }
      ];

      language-server = {
        nixd = {
          command = "${pkgs.nixd}/bin/nixd";
        };
        nil = {
          command = "${pkgs.nil}/bin/nil";
          config = {
            flake = {
              autoArchive = true;
              autoEvalInputs = true;
            };
          };
        };
        marksman = {
          command = "${pkgs.marksman}/bin/marksman";
        };
      };
    };
  };
}
