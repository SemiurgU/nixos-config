{pkgs, ...}: {
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      rust-analyzer
      nixd
      nil
      bash-language-server
      shellcheck
      shfmt
      lua-language-server
      markdown-oxide
    ];

    settings = {
      theme = "gruvbox-material";
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
  };
}
