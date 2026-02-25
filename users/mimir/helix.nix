{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "kanagawa";
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
