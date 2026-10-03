{pkgs, ...}: {
  imports = [
    ./theme.nix
    ./default.nix
  ];

  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          email = "semiurg1@gmail.com";
          name = "Semiurg";
        };
      };
    };
    kitty = {
      enable = true;
      shellIntegration.enableBashIntegration = true;
      enableGitIntegration = true;
      extraConfig = "
      include dank-tabs.conf
      include dank-theme.conf
        ";
    };
    mpv = {
      enable = true;
      config = {
        cache = "yes";
        demuxer-max-bytes = "1024MiB";
        demuxer-max-back-bytes = "512MiB";
        osc = true;
        sub-auto = "fuzzy";
        audio-file-auto = "fuzzy";
        ytdl-format = "bestvideo+bestaudio/best";
        screenshot-format = "png";
        screenshot-directory = "~/Pictures/mpv-screens";
      };
      scripts = with pkgs; [
        mpvScripts.webtorrent-mpv-hook
        mpvScripts.thumbfast
        mpvScripts.mpris
        mpvScripts.sponsorblock
      ];
    };

    lutris.enable = true;
  };

  home = {
    packages = with pkgs; [
      qimgv
      piper
      gh
      ripgrep
      neovide
      qbittorrent-enhanced
      proton-vpn
      lazygit
      networkmanagerapplet
      krita
      vesktop
      localsend

      kdePackages.kimageformats
    ];

    sessionVariables = {
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
      HISTFILE = "$XDG_STATE_HOME/bash/history";
      CARGO_HOME = "$XDG_DATA_HOME/cargo";
      NPM_CONFIG_CACHE = "$XDG_CACHE_HOME/npm";
      NPM_CONFIG_TMP = "$XDG_RUNTIME_DIR/npm";
      NPM_CONFIG_INIT_MODULE = "$XDG_CONFIG_HOME/npm/config/npm-init.js";
      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
      PARALLEL_HOME = "$XDG_CONFIG_HOME/parallel";
      PYTHON_HISTORY = "$XDG_STATE_HOME/python_history";
    };

    stateVersion = "25.11";
  };
}
