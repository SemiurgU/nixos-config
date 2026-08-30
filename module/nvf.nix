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
          pkgs.lua
          pkgs.fd
        ];

        options = {
          tabstop = 2;
          shiftwidth = 0;
          shiftround = true;
          expandtab = true;
          autoindent = true;
        };

        git.enable = true;
        telescope.enable = true;
        notify.nvim-notify.enable = true;
        terminal.toggleterm = {
          enable = true;
          mappings.open = "tt";
          lazygit.enable = true;
        };

        ui = {
          colorful-menu-nvim.enable = true;
          colorizer.enable = true;
          dropbar-nvim.enable = true;
        };
        binds.whichKey.enable = true;
        statusline.lualine.enable = true;

        visuals = {
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          rainbow-delimiters.enable = true;
        };
        mini = {
          animate.enable = true;
          basics.enable = true;
          clue.enable = true;
          completion.enable = true;
          cursorword.enable = true;
          icons.enable = true;
          pairs.enable = true;
          ai.enable = true;
          splitjoin.enable = true;
        };
        utility = {
          oil-nvim = {
            enable = true;
            gitStatus.enable = true;
            setupOpts = {
              columns = [
                "icon"
                "permissions"
                "size"
                "mtime"
              ];
              delete_to_trash = true;
            };
          };
          nix-develop.enable = true;
          direnv.enable = true;
          undotree.enable = true;
          smart-splits.enable = true;
        };

        treesitter = {
          enable = true;
          addDefaultGrammars = true;
          autotagHtml = true;
          grammars = pkgs.vimPlugins.nvim-treesitter.allGrammars;
        };

        formatter.conform-nvim.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          otter-nvim.enable = true;
          lightbulb.enable = true;
          trouble.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          nix.lsp.servers = [
            "nixd"
          ];

          markdown.enable = true;
          markdown.extensions.render-markdown-nvim.enable = true;

          lua.enable = true;
          lua.extraDiagnostics.enable = true;

          rust.enable = true;
          rust.extensions.crates-nvim.enable = true;
        };

        theme = {
          enable = true;
          name = "everforest";
          style = "hard";
          transparent = true;
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
