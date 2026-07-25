{pkgs, ...}: let
  mangolsp = pkgs.buildGoModule {
    pname = "mangolsp";
    version = "unstable-2026-07-25";
    src = pkgs.fetchFromGitHub {
      owner = "ernestoCruz05";
      repo = "mangolsp";
      rev = "main"; # pin to a real commit sha for reproducibility
      hash = "sha256-tTT7yUHTb703wt5GJgAA0TNGOFGXNIvUomIGPDhuwAo="; # placeholder, see below
    };
    vendorHash = "sha256-ojp/l2cc64wimABFH13tonHr5fmvzd4c81PsPCBRG0I=";
    subPackages = ["cmd/mangolsp"];
  };
in {
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
      mangolsp
    ];

    languages = {
      language-server.mangolsp.command = "mangolsp";
      language = [
        {
          name = "mango";
          scope = "source.mango";
          file-types = [
            {glob = ".config/mango/**/*.conf";}
            {glob = "/etc/mango/*.conf";}
          ];
          language-servers = ["mangolsp"];
        }
      ];
    };

    settings = {
      theme = "everforest_dark";
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
