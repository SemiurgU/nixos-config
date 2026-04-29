{pkgs, ...}: {
  imports = [
    ./default.nix
  ];
  services.mpd = {
    enable = true;
    musicDirectory = "/home/mimir/Music/";
    # Optional:
    network.listenAddress = "any"; # if you want to allow non-localhost connections
    network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };
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
    rmpc.enable = true;
    mpv = {
      enable = true;
      scripts = with pkgs; [
        mpvScripts.thumbfast
        mpvScripts.mpris
        mpvScripts.sponsorblock
      ];
    };
    yazi = {
      enable = true;
      extraPackages = [pkgs.exiftool];
    };
    swayimg.enable = true;
  };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    gtk4.theme = null;
  };

  home.packages = with pkgs; [
    (pkgs.callPackage ./pkgs/surge.nix {})
    localsend
    ripgrep
    qbittorrent-enhanced
    prismlauncher
    bat
    proton-vpn
    blockbench
    lazygit
    bibata-cursors
    xwayland-satellite
    kitty
    nautilus
    btop
    kew
    networkmanagerapplet
    adw-bluetooth
    qt6Packages.qt6ct
    papirus-icon-theme
    hicolor-icon-theme
    vesktop
    telegram-desktop
    #thumbnails
    ffmpeg-headless
    ffmpegthumbnailer
    gdk-pixbuf
    libheif.bin
    libheif.out
    libavif
    libjxl
    webp-pixbuf-loader
  ];

  home.stateVersion = "25.11";
}
