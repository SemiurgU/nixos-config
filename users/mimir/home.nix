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
    drawy
    gh
    localsend
    ripgrep
    qbittorrent-enhanced
    prismlauncher
    bat
    proton-vpn
    lazygit
    bibata-cursors
    xwayland-satellite
    kitty
    nautilus
    btop
    kew
    networkmanagerapplet

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
