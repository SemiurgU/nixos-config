{pkgs, ...}: {
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SYSTEMD_EDITOR = "nvim";
  };
  programs = {
    nvf.enable = true;
    nvf.settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        extraPackages = [
          pkgs.tree-sitter
          pkgs.gcc
          pkgs.llvm
          pkgs.rust-analyzer
          pkgs.cargo
          pkgs.rustc
        ];

        options = {
          tabstop = 2;
          shiftwidth = 0;
          shiftround = true;
          expandtab = true;
          autoindent = true;
        };
        telescope.enable = true;
        terminal.toggleterm = {
          enable = true;
          mappings.open = "tt";
          lazygit.enable = true;
        };

        ui = {
          colorful-menu-nvim.enable = true;
          colorizer = {
            enable = true;
          };
        };
        binds.whichKey.enable = true;
        visuals = {
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
        };
        mini = {
          animate.enable = true;
          basics.enable = true;
          clue.enable = true;
          completion.enable = true;
          cursorword.enable = true;
          icons.enable = true;
          pairs.enable = true;
        };
        utility = {
          oil-nvim = {
            enable = true;
            gitStatus.enable = true;
          };
          nix-develop.enable = true;
          direnv.enable = true;
          undotree.enable = true;
        };

        treesitter = {
          enable = true;
          addDefaultGrammars = true;
          autotagHtml = true;
          context.enable = true;
          grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        };

        lsp = {
          enable = true;
          inlayHints.enable = true;
          formatOnSave = true;
          otter-nvim.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix = {
            enable = true;
            lsp.servers = ["nixd" "nil"];
          };
          markdown = {
            enable = true;
            extensions.render-markdown-nvim.enable = true;
          };
          typst.enable = true;
          json.enable = true;
          yaml.enable = true;
          java.enable = true;
          clang.enable = true;
          clang.dap.enable = true;
          qml.enable = true;
          lua.enable = true;
          lua.extraDiagnostics.enable = true;
          go.enable = true;
          go.dap.enable = true;
          rust.enable = true;
          rust.extensions.crates-nvim.enable = true;
        };
        theme = {
          enable = true;
          name = "base16";
          base16-colors = {
            base00 = "#152326"; # Background
            base01 = "#1c2b2e"; # Lighter Background
            base02 = "#263338"; # Selection Background
            base03 = "#3b4b52"; # Comments/Invisibles
            base04 = "#70848f"; # Dark Foreground
            base05 = "#91a4ad"; # Default Foreground
            base06 = "#a7b8c2"; # Light Foreground
            base07 = "#c2d1d9"; # Lightest Foreground
            base08 = "#ff5b61"; # Variables/Red
            base09 = "#ffcf99"; # Integers/Orange
            base0A = "#fdd9af"; # Classes/Yellow
            base0B = "#9dc6a9"; # Strings/Green
            base0C = "#f9ada1"; # Support/Cyan
            base0D = "#86bfd2"; # Functions/Blue
            base0E = "#d59cce"; # Keywords/Purple
            base0F = "#d48588"; # Deprecated/Brown
          };
        };
        keymaps = [
          {
            key = "<leader>u";
            mode = "n";
            action = ":UndotreeToggle<CR>";
            silent = true;
            desc = "Toggle Undotree";
          }

          {
            key = "<leader>cc";
            mode = "n";
            action = ":ColorizerToggle<CR>";
            silent = true;
            desc = "Toggle Colorizer";
          }

          {
            key = "-";
            mode = "n";
            action = ":Oil<CR>";
            silent = true;
            desc = "Open Oil (File Explorer)";
          }
        ];
      };
    };
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
  };
}
