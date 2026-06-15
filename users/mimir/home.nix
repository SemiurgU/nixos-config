{pkgs, ...}: {
  imports = [
    ./theme.nix
    ./default.nix
  ];
  services.mpd = {
    enable = true;
    musicDirectory = "/home/mimir/Music/";
    network.listenAddress = "any";
    network.startWhenNeeded = true;
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

  home.packages = with pkgs; [
    neovide
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
    vulkan-tools

    qt6Packages.qt6ct
    papirus-icon-theme
    hicolor-icon-theme
    vesktop
    telegram-desktop
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
