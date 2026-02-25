{pkgs, ...}: {
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SYSTEMD_EDITOR = "nvim";
  };

  programs.nvf.enable = true;
  programs.nvf.settings = {
    vim = {
      viAlias = true;
      vimAlias = true;

      extraPackages = [
        pkgs.gcc
        pkgs.llvm
        pkgs.rust-analyzer
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
      autocomplete.blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };
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
        oil-nvim.enable = true;
        oil-nvim.gitStatus.enable = true;
        nix-develop.enable = true;
        direnv.enable = true;
        undotree.enable = true;
      };

      lsp = {
        enable = true;
        inlayHints.enable = true;
        formatOnSave = true;
        otter-nvim.enable = true;
        # nvim-docs-view.enable = true;
        # lightbulb.enable = true;
      };
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        typst.enable = true;
        json.enable = true;
        yaml.enable = true;
        java.enable = true;
        clang.enable = true;
        clang.dap.enable = true;

        lua = {
          enable = true;
          extraDiagnostics.enable = true;
        };

        go.enable = true;
        go.dap.enable = true;

        rust = {
          enable = true;
          extensions.crates-nvim.enable = true;
        };
      };
      theme = {
        enable = true;
        base16-colors = {
          base00 = "#000000";
          base01 = "#f2826d";
          base02 = "#6dafb5";
          base03 = "#e0ba70";
          base04 = "#8fb4cd";
          base05 = "#bb98d9";
          base06 = "#b2babf";
          base07 = "#e6e4d3";
          base08 = "#b3b3b3";
          base09 = "#f2826d";
          base0A = "#6dafb5";
          base0B = "#ffdd99";
          base0C = "#8fb4cd";
          base0D = "#bb98d9";
          base0E = "#a9c9cc";
          base0F = "#2f4656";
        };
      };
    };
  };
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
